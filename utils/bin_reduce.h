#define MEGDNN_DISABLE_FLOT16 1
#define _MEGDNN_ELEMWISE_MODE_ENABLE_IMPL_RELU(_cb) _cb(RELU)
#define _MEGDNN_ELEMWISE_MODE_ENABLE_IMPL_ABS(_cb) 
#define _MEGDNN_ELEMWISE_MODE_ENABLE_IMPL_ACOS(_cb) 
#define _MEGDNN_ELEMWISE_MODE_ENABLE_IMPL_ASIN(_cb) 
#define _MEGDNN_ELEMWISE_MODE_ENABLE_IMPL_CEIL(_cb) 
#define _MEGDNN_ELEMWISE_MODE_ENABLE_IMPL_COS(_cb) 
#define _MEGDNN_ELEMWISE_MODE_ENABLE_IMPL_EXP(_cb) _cb(EXP)
#define _MEGDNN_ELEMWISE_MODE_ENABLE_IMPL_FLOOR(_cb) 
#define _MEGDNN_ELEMWISE_MODE_ENABLE_IMPL_LOG(_cb) 
#define _MEGDNN_ELEMWISE_MODE_ENABLE_IMPL_NEGATE(_cb) 
#define _MEGDNN_ELEMWISE_MODE_ENABLE_IMPL_SIGMOID(_cb) 
#define _MEGDNN_ELEMWISE_MODE_ENABLE_IMPL_SIN(_cb) 
#define _MEGDNN_ELEMWISE_MODE_ENABLE_IMPL_TANH(_cb) 
#define _MEGDNN_ELEMWISE_MODE_ENABLE_IMPL_ABS_GRAD(_cb) 
#define _MEGDNN_ELEMWISE_MODE_ENABLE_IMPL_ADD(_cb) _cb(ADD)
#define _MEGDNN_ELEMWISE_MODE_ENABLE_IMPL_FLOOR_DIV(_cb) 
#define _MEGDNN_ELEMWISE_MODE_ENABLE_IMPL_MAX(_cb) 
#define _MEGDNN_ELEMWISE_MODE_ENABLE_IMPL_MIN(_cb) 
#define _MEGDNN_ELEMWISE_MODE_ENABLE_IMPL_MOD(_cb) 
#define _MEGDNN_ELEMWISE_MODE_ENABLE_IMPL_MUL(_cb) 
#define _MEGDNN_ELEMWISE_MODE_ENABLE_IMPL_POW(_cb) 
#define _MEGDNN_ELEMWISE_MODE_ENABLE_IMPL_SIGMOID_GRAD(_cb) 
#define _MEGDNN_ELEMWISE_MODE_ENABLE_IMPL_SUB(_cb) _cb(SUB)
#define _MEGDNN_ELEMWISE_MODE_ENABLE_IMPL_SWITCH_GT0(_cb) 
#define _MEGDNN_ELEMWISE_MODE_ENABLE_IMPL_TANH_GRAD(_cb) 
#define _MEGDNN_ELEMWISE_MODE_ENABLE_IMPL_TRUE_DIV(_cb) _cb(TRUE_DIV)
#define _MEGDNN_ELEMWISE_MODE_ENABLE_IMPL_LT(_cb) 
#define _MEGDNN_ELEMWISE_MODE_ENABLE_IMPL_LEQ(_cb) 
#define _MEGDNN_ELEMWISE_MODE_ENABLE_IMPL_EQ(_cb) 
#define _MEGDNN_ELEMWISE_MODE_ENABLE_IMPL_COND_LEQ_MOV(_cb) 
#define _MEGDNN_ELEMWISE_MODE_ENABLE_IMPL_FUSE_MUL_ADD3(_cb) 
#define _MEGDNN_ELEMWISE_MODE_ENABLE_IMPL_FUSE_MUL_ADD4(_cb) 
#define MEGDNN_ELEMWISE_MODE_ENABLE(_mode, _cb) _MEGDNN_ELEMWISE_MODE_ENABLE_IMPL_##_mode(_cb)
#define MGB_OPR_REGISTRY_CALLER_SPECIALIZE } \
namespace opr { \
class Host2DeviceCopy; \
class SharedDeviceTensor; \
class MatrixMul; \
class Dimshuffle; \
class Elemwise; \
class GetVarShape; \
class ImmutableTensor; \
class ConvolutionForward; \
class PoolingForward; \
class Reduce; \
class Subtensor; \
class Concat; \
class Reshape; \
} \
namespace serialization { \
 \
            template<class Opr, class Callee> \
            struct OprRegistryCaller { \
            };  \
 \
                template<class Callee> \
                struct OprRegistryCaller<opr::Concat, Callee>: public \
                    OprRegistryCallerDefaultImpl<Callee> { \
                };  \
 \
                template<class Callee> \
                struct OprRegistryCaller<opr::ConvolutionForward, Callee>: public \
                    OprRegistryCallerDefaultImpl<Callee> { \
                };  \
 \
                template<class Callee> \
                struct OprRegistryCaller<opr::Dimshuffle, Callee>: public \
                    OprRegistryCallerDefaultImpl<Callee> { \
                };  \
 \
                template<class Callee> \
                struct OprRegistryCaller<opr::Elemwise, Callee>: public \
                    OprRegistryCallerDefaultImpl<Callee> { \
                };  \
 \
                template<class Callee> \
                struct OprRegistryCaller<opr::GetVarShape, Callee>: public \
                    OprRegistryCallerDefaultImpl<Callee> { \
                };  \
 \
                template<class Callee> \
                struct OprRegistryCaller<opr::Host2DeviceCopy, Callee>: public \
                    OprRegistryCallerDefaultImpl<Callee> { \
                };  \
 \
                template<class Callee> \
                struct OprRegistryCaller<opr::ImmutableTensor, Callee>: public \
                    OprRegistryCallerDefaultImpl<Callee> { \
                };  \
 \
                template<class Callee> \
                struct OprRegistryCaller<opr::MatrixMul, Callee>: public \
                    OprRegistryCallerDefaultImpl<Callee> { \
                };  \
 \
                template<class Callee> \
                struct OprRegistryCaller<opr::PoolingForward, Callee>: public \
                    OprRegistryCallerDefaultImpl<Callee> { \
                };  \
 \
                template<class Callee> \
                struct OprRegistryCaller<opr::Reduce, Callee>: public \
                    OprRegistryCallerDefaultImpl<Callee> { \
                };  \
 \
                template<class Callee> \
                struct OprRegistryCaller<opr::Reshape, Callee>: public \
                    OprRegistryCallerDefaultImpl<Callee> { \
                };  \
 \
                template<class Callee> \
                struct OprRegistryCaller<opr::SharedDeviceTensor, Callee>: public \
                    OprRegistryCallerDefaultImpl<Callee> { \
                };  \
 \
                template<class Callee> \
                struct OprRegistryCaller<opr::Subtensor, Callee>: public \
                    OprRegistryCallerDefaultImpl<Callee> { \
                };
