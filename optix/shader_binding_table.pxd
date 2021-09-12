from .common cimport CUdeviceptr


cdef extern from "optix_includes.h" nogil:
    cdef struct OptixShaderBindingTable:
        CUdeviceptr    raygenRecord
        CUdeviceptr    exceptionRecord
        CUdeviceptr    missRecordBase
        unsigned int    missRecordStrideInBytes
        unsigned int    missRecordCount
        CUdeviceptr    hitgroupRecordBase
        unsigned int    hitgroupRecordStrideInBytes
        unsigned int    hitgroupRecordCount
        CUdeviceptr    callablesRecordBase
        unsigned int    callablesRecordStrideInBytes
        unsigned int    callablesRecordCount

cdef class ShaderBindingTable:
    cdef OptixShaderBindingTable _shader_binding_table
    cdef object _d_raygen_record
    cdef object _d_exception_record
    cdef object _d_miss_records
    cdef object _d_hitgroup_records
    cdef object _d_callables_records