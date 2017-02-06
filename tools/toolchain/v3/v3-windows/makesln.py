#!/usr/bin/env python3

import os
import sys
import uuid
from common import *

def main(argv):
    global rootPath
    global outputPath

    rootPath = 'bazel-out/v3-windows-fastbuild/bin'
    outputPath = 'bazel-out/vs2013'

    if not os.path.isdir(outputPath):
        os.mkdir(outputPath)

    prjFiles = []
    for dirpath, dirs, files in os.walk(rootPath):
        for file in [f for f in files if f.endswith('.a')]:
            if not file.find('.internal_cc_library.') >= 0:
                prjFiles.append(buildPrj(dirpath, file[:-2] + '.vcxproj', 'StaticLibrary'))
    
    for dirpath, dirs, files in os.walk(rootPath):
        for file in [f for f in files if f.endswith('.a')]:
            if file.find('.internal_cc_library.') >= 0:
                prjFiles.append(buildPrj(dirpath, file.replace('internal_cc_library.', '')[:-2] + '.vcxproj', 'DynamicLibrary', prjFiles))

    for dirpath, dirs, files in os.walk(rootPath):
        for file in [f for f in files if f.endswith('.so')]:
            buildSln(dirpath, file[:-3] + '.sln', prjFiles)

def buildSln(dirpath, slnFileName, prjFiles):
    print ("Build %s from %s ..." % (slnFileName, dirpath))
    global rootPath
    global outputPath
    
    slnContent = fillSlnTemplate(prjFiles)
    writefile(os.path.join(outputPath, slnFileName), slnContent)

def getRefinedParams(dotdFiles, depth):
    output = []
    param = readfile(dotdFiles[0] + '.d').split('\n')
    i = 0
    while i < len(param):
        p = param[i]
        i += 1
        if p is None or len(p) == 0 or p.isspace():
            continue
        if p == '-include':
            output.append('-Xclang -include,' + os.path.join(depth, param[i]))
            i += 1
        elif (p.startswith('-I')):
            output.append('-I' + os.path.join(depth, p[2:]))
        elif (p.startswith('-D')):
            output.append(p)
        elif (p == '-fno-rtti'):
            pass
        elif (p.startswith('!')):
            output.append('-' + p[1:])
        elif (p.startswith('-')):
            output.append('-Xclang ' + p)
        elif (p.startswith('/')):
            pass
        else:
            assert False, "Unknown... " + p


    return output

def buildPrj(dirpath, projectFileName, configurationType, projectDependencies = []):
    global rootPath
    global outputPath
    depth = os.path.join(*(['..'] * len(outputPath.split('/'))))
    print ("Build %s from %s ..." % (projectFileName, dirpath))
    dotdFiles = []
    for dirpath, dirs, files in os.walk(os.path.join(dirpath, '_objs')):
        dotdFiles += [os.path.join(dirpath,file[:-2]) for file in files if file.endswith('.d')]
  

    realFiles = [os.path.join(*x[x.index('_objs')+2:]) for x in [d.split('/') for d in dotdFiles]]

    projectName = os.path.splitext(projectFileName)[0]
    projectGuid = str(uuid.uuid4())

    includes = {
      'release_x64'   : r"D:\Program Files (x86)\IntelSWTools\compilers_and_libraries\windows\mkl\include",
      'release_win32' : r"D:\Program Files (x86)\IntelSWTools\compilers_and_libraries\windows\mkl\include",
      'debug_x64'     : r"D:\Program Files (x86)\IntelSWTools\compilers_and_libraries\windows\mkl\include",
      'debug_win32'   : r"D:\Program Files (x86)\IntelSWTools\compilers_and_libraries\windows\mkl\include",
    }
    libpaths = {
      'release_x64'   : r"D:\Program Files (x86)\IntelSWTools\compilers_and_libraries\windows\mkl\lib\intel64",
      'release_win32' : r"D:\Program Files (x86)\IntelSWTools\compilers_and_libraries\windows\mkl\lib\ia32",
      'debug_x64'     : r"D:\Program Files (x86)\IntelSWTools\compilers_and_libraries\windows\mkl\lib\intel64",
      'debug_win32'   : r"D:\Program Files (x86)\IntelSWTools\compilers_and_libraries\windows\mkl\lib\ia32",
    }
    prjFileContent = fillPrjTemplate(
            depth = depth,
            projectName = projectName,
            files = realFiles, projectGuid = projectGuid,
            configurationType = configurationType, 
            additionalDependencies = '',
            projectDependencies = projectDependencies,
            additionalOptions = getRefinedParams(dotdFiles, depth), 
            additionalIncludes = includes,
            additionalLibPaths = libpaths,
            postBuildCommand = '')
    writefile(os.path.join(outputPath, projectFileName), prjFileContent)
    return {'projectGuid' : projectGuid, 'projectName' : projectName, 'projectFileName' : projectFileName, 'projectDependencies' : [x['projectGuid'] for x in projectDependencies]}

def fillSlnTemplate(projects):
    slnTemplate = """Microsoft Visual Studio Solution File, Format Version 12.00
# Visual Studio 2013
{projectPart}
Global
	GlobalSection(SolutionConfigurationPlatforms) = preSolution
		Debug|Win32 = Debug|Win32
		Release|Win32 = Release|Win32
		Debug|x64 = Debug|x64
		Release|x64 = Release|x64
	EndGlobalSection
	GlobalSection(ProjectConfigurationPlatforms) = postSolution
{configurationPart}
	EndGlobalSection
	GlobalSection(ExtensibilityGlobals) = postSolution
	EndGlobalSection
	GlobalSection(ExtensibilityAddIns) = postSolution
	EndGlobalSection
EndGlobal
"""
    slnGuid = '{' + str(uuid.uuid4()) + '}'
    projectPart = ''
    configurationPart = ''
    for prj in projects:
        projectPart += """Project("{slnGuid}") = "{projectName}", "{projectFileName}", "{projectGuid}"
	ProjectSection(ProjectDependencies) = postProject
{projectDependencies}	EndProjectSection
EndProject
""".format( slnGuid = slnGuid,
             projectGuid = '{' + prj['projectGuid'] + '}',
             projectName = prj['projectName'],
             projectFileName = prj['projectFileName'],
             projectDependencies = ''.join(['		{' + x + '} = {' + x + '}\n' for x in prj['projectDependencies']])
           )

        configurationPart += """		{projectGuid}.Debug|Win32.ActiveCfg = Debug|Win32
		{projectGuid}.Debug|Win32.Build.0 = Debug|Win32
		{projectGuid}.Release|Win32.ActiveCfg = Release|Win32
		{projectGuid}.Release|Win32.Build.0 = Release|Win32
		{projectGuid}.Debug|x64.ActiveCfg = Debug|x64
		{projectGuid}.Debug|x64.Build.0 = Debug|x64
		{projectGuid}.Release|x64.ActiveCfg = Release|x64
		{projectGuid}.Release|x64.Build.0 = Release|x64
""".format(projectGuid = '{' + prj['projectGuid'] + '}')

    return slnTemplate.format(projectPart = projectPart, configurationPart = configurationPart)

def fillPrjTemplate(depth, projectName, files, projectGuid, configurationType, additionalDependencies, projectDependencies, additionalOptions, additionalIncludes, additionalLibPaths, postBuildCommand):
    prjTemplate = """<?xml version="1.0" encoding="utf-8"?>
<Project DefaultTargets="Build" ToolsVersion="4.0" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
  <ItemGroup Label="ProjectConfigurations">
    <ProjectConfiguration Include="Debug|Win32">
      <Configuration>Debug</Configuration>
      <Platform>Win32</Platform>
    </ProjectConfiguration>
    <ProjectConfiguration Include="Debug|x64">
      <Configuration>Debug</Configuration>
      <Platform>x64</Platform>
    </ProjectConfiguration>
    <ProjectConfiguration Include="Release|Win32">
      <Configuration>Release</Configuration>
      <Platform>Win32</Platform>
    </ProjectConfiguration>
    <ProjectConfiguration Include="Release|x64">
      <Configuration>Release</Configuration>
      <Platform>x64</Platform>
    </ProjectConfiguration>
  </ItemGroup>
  {fileList}
  {projectReferenceList}
  <PropertyGroup Label="Globals">
    <ProjectGuid>{projectGuid}</ProjectGuid>
    <RootNamespace>megvii</RootNamespace>
  </PropertyGroup>
  <Import Project="$(VCTargetsPath)\Microsoft.Cpp.Default.props" />
  <PropertyGroup Condition="'$(Configuration)|$(Platform)'=='Debug|Win32'" Label="Configuration">
    <ConfigurationType>{configurationType}</ConfigurationType>
    <UseDebugLibraries>true</UseDebugLibraries>
    <CharacterSet>MultiByte</CharacterSet>
    <PlatformToolset>llvm-vs2013_xp</PlatformToolset>
  </PropertyGroup>
  <PropertyGroup Condition="'$(Configuration)|$(Platform)'=='Debug|x64'" Label="Configuration">
    <ConfigurationType>{configurationType}</ConfigurationType>
    <UseDebugLibraries>true</UseDebugLibraries>
    <CharacterSet>MultiByte</CharacterSet>
    <PlatformToolset>llvm-vs2013_xp</PlatformToolset>
  </PropertyGroup>
  <PropertyGroup Condition="'$(Configuration)|$(Platform)'=='Release|Win32'" Label="Configuration">
    <ConfigurationType>{configurationType}</ConfigurationType>
    <UseDebugLibraries>false</UseDebugLibraries>
    <WholeProgramOptimization>true</WholeProgramOptimization>
    <CharacterSet>MultiByte</CharacterSet>
    <PlatformToolset>llvm-vs2013_xp</PlatformToolset>
  </PropertyGroup>
  <PropertyGroup Condition="'$(Configuration)|$(Platform)'=='Release|x64'" Label="Configuration">
    <ConfigurationType>{configurationType}</ConfigurationType>
    <UseDebugLibraries>false</UseDebugLibraries>
    <WholeProgramOptimization>true</WholeProgramOptimization>
    <CharacterSet>MultiByte</CharacterSet>
    <PlatformToolset>llvm-vs2013_xp</PlatformToolset>
  </PropertyGroup>
  <Import Project="$(VCTargetsPath)\Microsoft.Cpp.props" />
  <ImportGroup Label="ExtensionSettings">
    <Import Project="$(VCTargetsPath)\BuildCustomizations\CUDA 8.0.props" />
  </ImportGroup>
  <ImportGroup Condition="'$(Configuration)|$(Platform)'=='Debug|Win32'" Label="PropertySheets">
    <Import Condition="exists('$(UserRootDir)\Microsoft.Cpp.$(Platform).user.props')" Label="LocalAppDataPlatform" Project="$(UserRootDir)\Microsoft.Cpp.$(Platform).user.props" />
  </ImportGroup>
  <ImportGroup Condition="'$(Configuration)|$(Platform)'=='Debug|x64'" Label="PropertySheets">
    <Import Condition="exists('$(UserRootDir)\Microsoft.Cpp.$(Platform).user.props')" Label="LocalAppDataPlatform" Project="$(UserRootDir)\Microsoft.Cpp.$(Platform).user.props" />
  </ImportGroup>
  <ImportGroup Condition="'$(Configuration)|$(Platform)'=='Release|Win32'" Label="PropertySheets">
    <Import Condition="exists('$(UserRootDir)\Microsoft.Cpp.$(Platform).user.props')" Label="LocalAppDataPlatform" Project="$(UserRootDir)\Microsoft.Cpp.$(Platform).user.props" />
  </ImportGroup>
  <ImportGroup Condition="'$(Configuration)|$(Platform)'=='Release|x64'" Label="PropertySheets">
    <Import Condition="exists('$(UserRootDir)\Microsoft.Cpp.$(Platform).user.props')" Label="LocalAppDataPlatform" Project="$(UserRootDir)\Microsoft.Cpp.$(Platform).user.props" />
  </ImportGroup>
  <PropertyGroup Label="UserMacros">
    <IntDir>_Objs\{projectName}\$(Configuration)\$(Platform)\</IntDir>
    <TargetName>{projectName}</TargetName>
    <OutDir>Bin\{projectName}\$(Configuration)\$(Platform)\</OutDir>
  </PropertyGroup>
  <PropertyGroup Condition="'$(Configuration)|$(Platform)'=='Debug|Win32'">
    <LinkIncremental>true</LinkIncremental>
  </PropertyGroup>
  <PropertyGroup Condition="'$(Configuration)|$(Platform)'=='Debug|x64'">
    <LinkIncremental>true</LinkIncremental>
  </PropertyGroup>
  <ItemDefinitionGroup Condition="'$(Configuration)|$(Platform)'=='Debug|Win32'">
    <ClCompile>
      <WarningLevel>Level3</WarningLevel>
      <Optimization>Disabled</Optimization>
      <PreprocessorDefinitions>WIN32;_CONSOLE;_DEBUG;WIN32_LLVM_TOOLCHAIN;%(PreprocessorDefinitions);</PreprocessorDefinitions>
      <AdditionalIncludeDirectories>{additionalIncludes[debug_win32]};%(AdditionalIncludeDirectories)</AdditionalIncludeDirectories>
      <AdditionalOptions>{additionalOptions} %(AdditionalOptions)</AdditionalOptions>
    </ClCompile>
    <Link>
      <GenerateDebugInformation>true</GenerateDebugInformation>
      <SubSystem>Console</SubSystem>
      <AdditionalLibraryDirectories>{additionalLibPaths[debug_win32]};%(AdditionalLibraryDirectories)</AdditionalLibraryDirectories>
      <AdditionalDependencies>{additionalDependencies};mkl_intel_c.lib;mkl_sequential.lib; mkl_core.lib;cudart.lib;kernel32.lib;user32.lib;gdi32.lib;winspool.lib;comdlg32.lib;advapi32.lib;shell32.lib;ole32.lib;oleaut32.lib;uuid.lib;odbc32.lib;odbccp32.lib;%(AdditionalDependencies)</AdditionalDependencies>
    </Link>
    <PostBuildEvent>
      <Command>{postBuildCommand}</Command>
    </PostBuildEvent>
    <CudaCompile>
      <TargetMachinePlatform>32</TargetMachinePlatform>
      <CodeGeneration>compute_35,sm_35</CodeGeneration>
      <AdditionalOptions>-Xcompiler "/wd4819 /FS"  -Xcompiler /MTd  -include megdnn_debug.h  -gencode arch=compute_35,code=sm_35 %(AdditionalOptions)</AdditionalOptions>
      <Defines>
      </Defines>
      <CompileOut>$(IntDir)\%(RelativeDir)\%(Filename)%(Extension).obj</CompileOut>
      <AdditionalCompilerOptions>/FS</AdditionalCompilerOptions>
      <GPUDebugInfo>true</GPUDebugInfo>
      <HostDebugInfo>true</HostDebugInfo>
    </CudaCompile>
  </ItemDefinitionGroup>
  <ItemDefinitionGroup Condition="'$(Configuration)|$(Platform)'=='Debug|x64'">
    <ClCompile>
      <WarningLevel>Level3</WarningLevel>
      <Optimization>Disabled</Optimization>
      <PreprocessorDefinitions>WIN32;_CONSOLE;_DEBUG;WIN32_LLVM_TOOLCHAIN;%(PreprocessorDefinitions);</PreprocessorDefinitions>
      <AdditionalIncludeDirectories>{additionalIncludes[debug_x64]};%(AdditionalIncludeDirectories)</AdditionalIncludeDirectories>
      <AdditionalOptions>{additionalOptions} %(AdditionalOptions)</AdditionalOptions>
      <DisableSpecificWarnings>
      </DisableSpecificWarnings>
      <ProgramDataBaseFileName />
      <DebugInformationFormat>ProgramDatabase</DebugInformationFormat>
      <RuntimeLibrary>MultiThreadedDebug</RuntimeLibrary>
    </ClCompile>
    <Link>
      <GenerateDebugInformation>true</GenerateDebugInformation>
      <SubSystem>Console</SubSystem>
      <AdditionalLibraryDirectories>{additionalLibPaths[debug_x64]};%(AdditionalLibraryDirectories)</AdditionalLibraryDirectories>
      <AdditionalDependencies>{additionalDependencies};mkl_intel_lp64.lib;mkl_sequential.lib; mkl_core.lib;cudart.lib;kernel32.lib;user32.lib;gdi32.lib;winspool.lib;comdlg32.lib;advapi32.lib;shell32.lib;ole32.lib;oleaut32.lib;uuid.lib;odbc32.lib;odbccp32.lib;%(AdditionalDependencies)</AdditionalDependencies>
    </Link>
    <PostBuildEvent>
      <Command>
      </Command>
    </PostBuildEvent>
    <CudaCompile>
      <TargetMachinePlatform>64</TargetMachinePlatform>
      <CodeGeneration>compute_35,sm_35</CodeGeneration>
      <AdditionalOptions>-Xcompiler "/wd4819 /FS"  -Xcompiler /MTd  -include megdnn_debug.h  -gencode arch=compute_35,code=sm_35 %(AdditionalOptions)</AdditionalOptions>
      <Defines>
      </Defines>
      <CompileOut>$(IntDir)\%(RelativeDir)\%(Filename)%(Extension).obj</CompileOut>
      <AdditionalCompilerOptions>/FS</AdditionalCompilerOptions>
      <GPUDebugInfo>true</GPUDebugInfo>
      <HostDebugInfo>true</HostDebugInfo>
    </CudaCompile>
  </ItemDefinitionGroup>
  <ItemDefinitionGroup Condition="'$(Configuration)|$(Platform)'=='Release|Win32'">
    <ClCompile>
      <WarningLevel>Level3</WarningLevel>
      <Optimization>MaxSpeed</Optimization>
      <FunctionLevelLinking>true</FunctionLevelLinking>
      <IntrinsicFunctions>true</IntrinsicFunctions>
      <PreprocessorDefinitions>WIN32;_CONSOLE;WIN32_LLVM_TOOLCHAIN;%(PreprocessorDefinitions);NDEBUG=1;</PreprocessorDefinitions>
      <AdditionalOptions>{additionalOptions} %(AdditionalOptions)</AdditionalOptions>
      <AdditionalIncludeDirectories>{additionalIncludes[release_win32]};%(AdditionalIncludeDirectories)</AdditionalIncludeDirectories>
    </ClCompile>
    <Link>
      <GenerateDebugInformation>true</GenerateDebugInformation>
      <EnableCOMDATFolding>true</EnableCOMDATFolding>
      <OptimizeReferences>true</OptimizeReferences>
      <SubSystem>Console</SubSystem>
      <AdditionalLibraryDirectories>{additionalLibPaths[release_win32]};%(AdditionalLibraryDirectories)</AdditionalLibraryDirectories>
      <AdditionalDependencies>{additionalDependencies};mkl_intel_c.lib;mkl_sequential.lib; mkl_core.lib;cudart.lib;kernel32.lib;user32.lib;gdi32.lib;winspool.lib;comdlg32.lib;advapi32.lib;shell32.lib;ole32.lib;oleaut32.lib;uuid.lib;odbc32.lib;odbccp32.lib;%(AdditionalDependencies)</AdditionalDependencies>
    </Link>
    <PostBuildEvent>
      <Command>{postBuildCommand}</Command>
    </PostBuildEvent>
    <CudaCompile>
      <TargetMachinePlatform>32</TargetMachinePlatform>
      <CodeGeneration>compute_35,sm_35;compute_52,sm_52;compute_61,sm_61</CodeGeneration>
      <AdditionalOptions>-Xcompiler /wd4819  -Xcompiler /MT  -include megdnn_release.h  -gencode arch=compute_35,code=sm_35  -gencode arch=compute_52,code=sm_52  -gencode arch=compute_61,code=sm_61 %(AdditionalOptions)</AdditionalOptions>
      <Defines>WIN32;WIN64;_CONSOLE;WIN32_LLVM_TOOLCHAIN;%(PreprocessorDefinitions);NDEBUG=1;</Defines>
      <CompileOut>$(IntDir)\%(RelativeDir)\%(Filename)%(Extension).obj</CompileOut>
      <UseHostDefines>true</UseHostDefines>
    </CudaCompile>
  </ItemDefinitionGroup>
  <ItemDefinitionGroup Condition="'$(Configuration)|$(Platform)'=='Release|x64'">
    <ClCompile>
      <WarningLevel>Level3</WarningLevel>
      <Optimization>MaxSpeed</Optimization>
      <PreprocessorDefinitions>WIN32;_CONSOLE;NDEBUG=1;%(PreprocessorDefinitions);</PreprocessorDefinitions>
      <AdditionalIncludeDirectories>{additionalIncludes[release_x64]};%(AdditionalIncludeDirectories)</AdditionalIncludeDirectories>
      <DisableSpecificWarnings>
      </DisableSpecificWarnings>
      <ProgramDataBaseFileName />
      <FunctionLevelLinking>true</FunctionLevelLinking>
      <IntrinsicFunctions>true</IntrinsicFunctions>
      <SDLCheck>true</SDLCheck>
      <RuntimeLibrary>MultiThreaded</RuntimeLibrary>
      <AdditionalOptions>{additionalOptions} %(AdditionalOptions)</AdditionalOptions>
    </ClCompile>
    <Link>
      <GenerateDebugInformation>true</GenerateDebugInformation>
      <SubSystem>Console</SubSystem>
      <AdditionalLibraryDirectories>{additionalLibPaths[release_x64]};%(AdditionalLibraryDirectories)</AdditionalLibraryDirectories>
      <AdditionalDependencies>{additionalDependencies};mkl_intel_lp64.lib;mkl_sequential.lib; mkl_core.lib;cudart.lib;kernel32.lib;user32.lib;gdi32.lib;winspool.lib;comdlg32.lib;advapi32.lib;shell32.lib;ole32.lib;oleaut32.lib;uuid.lib;odbc32.lib;odbccp32.lib;%(AdditionalDependencies)</AdditionalDependencies>
      <EnableCOMDATFolding>true</EnableCOMDATFolding>
      <OptimizeReferences>true</OptimizeReferences>
    </Link>
    <PostBuildEvent>
      <Command>
      </Command>
    </PostBuildEvent>
    <CudaCompile>
      <TargetMachinePlatform>64</TargetMachinePlatform>
      <CodeGeneration>compute_35,sm_35;compute_52,sm_52;compute_61,sm_61</CodeGeneration>
      <AdditionalOptions>-Xcompiler /wd4819  -Xcompiler /MT  -include megdnn_release.h  -gencode arch=compute_35,code=sm_35  -gencode arch=compute_52,code=sm_52  -gencode arch=compute_61,code=sm_61 %(AdditionalOptions)</AdditionalOptions>
      <Defines>WIN32;WIN64;_CONSOLE;%(PreprocessorDefinitions);NDEBUG=1;</Defines>
      <CompileOut>$(IntDir)\%(RelativeDir)\%(Filename)%(Extension).obj</CompileOut>
      <UseHostDefines>true</UseHostDefines>
    </CudaCompile>
  </ItemDefinitionGroup>
  <Import Project="$(VCTargetsPath)\Microsoft.Cpp.targets" />
  <ImportGroup Label="ExtensionTargets">
    <Import Project="$(VCTargetsPath)\BuildCustomizations\CUDA 8.0.targets" />
  </ImportGroup>
</Project>
"""
    ccfiles = [file for file in files if file.endswith('.cpp') or file.endswith('.c') or file.endswith('.cc') or file.endswith('.S')]
    cufiles = [file for file in files if file.endswith('.cu')]
    assert len(ccfiles) + len(cufiles) == len(files), "unsupported files..." + str([file for file in files if file not in ccfiles and file not in cufiles])

    fileList = ''
    if len(ccfiles) > 0:
        fileList += '<ItemGroup>'
        fileList += '\n'.join(['<ClCompile Include="' + os.path.join(depth, file) + '"><ObjectFileName>$(IntDir)/' + file + '.obj</ObjectFileName></ClCompile>' for file in ccfiles])
        fileList += '</ItemGroup>'
    if len(cufiles) > 0:
        fileList += '<ItemGroup>'
        fileList += '\n'.join(['<CudaCompile Include="' + os.path.join(depth, file) + '" />' for file in cufiles])
        fileList += '</ItemGroup>'

    projectReferenceList = '<ItemGroup>' + ''.join(['<ProjectReference Include=\'' + x['projectFileName'] + '\'><Project>{' + x['projectGuid'] + '}</Project></ProjectReference>' for x in projectDependencies]) + '</ItemGroup>'
    print(projectReferenceList)
    return prjTemplate.format(
          fileList = fileList,
          projectName = projectName,
          projectGuid = projectGuid, 
          configurationType = configurationType,
          additionalOptions = ' '.join(additionalOptions),
          additionalIncludes = additionalIncludes,
          additionalDependencies = additionalDependencies,
          additionalLibPaths = additionalLibPaths,
          projectReferenceList = projectReferenceList,
          postBuildCommand = postBuildCommand)



if __name__ == '__main__':
    sys.exit(main(sys.argv[1:]))
