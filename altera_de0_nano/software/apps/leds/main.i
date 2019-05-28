# 1 "main.c"
# 1 "/home/hiram/master/Qwark_stack/altera_de0_nano/software/apps/leds//"
# 1 "<built-in>"
#define __STDC__ 1
#define __STDC_VERSION__ 199901L
#define __STDC_HOSTED__ 1
#define __GNUC__ 7
#define __GNUC_MINOR__ 3
#define __GNUC_PATCHLEVEL__ 1
#define __VERSION__ "7.3.1"
#define __ATOMIC_RELAXED 0
#define __ATOMIC_SEQ_CST 5
#define __ATOMIC_ACQUIRE 2
#define __ATOMIC_RELEASE 3
#define __ATOMIC_ACQ_REL 4
#define __ATOMIC_CONSUME 1
#define __FINITE_MATH_ONLY__ 0
#define __SIZEOF_INT__ 2
#define __SIZEOF_LONG__ 4
#define __SIZEOF_LONG_LONG__ 8
#define __SIZEOF_SHORT__ 2
#define __SIZEOF_FLOAT__ 4
#define __SIZEOF_DOUBLE__ 8
#define __SIZEOF_LONG_DOUBLE__ 8
#define __SIZEOF_SIZE_T__ 2
#define __CHAR_BIT__ 8
#define __BIGGEST_ALIGNMENT__ 2
#define __ORDER_LITTLE_ENDIAN__ 1234
#define __ORDER_BIG_ENDIAN__ 4321
#define __ORDER_PDP_ENDIAN__ 3412
#define __BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__
#define __FLOAT_WORD_ORDER__ __ORDER_LITTLE_ENDIAN__
#define __SIZEOF_POINTER__ 2
#define __SIZE_TYPE__ unsigned int
#define __PTRDIFF_TYPE__ int
#define __WCHAR_TYPE__ long int
#define __WINT_TYPE__ unsigned int
#define __INTMAX_TYPE__ long long int
#define __UINTMAX_TYPE__ long long unsigned int
#define __CHAR16_TYPE__ short unsigned int
#define __CHAR32_TYPE__ long unsigned int
#define __SIG_ATOMIC_TYPE__ int
#define __INT8_TYPE__ signed char
#define __INT16_TYPE__ short int
#define __INT32_TYPE__ long int
#define __INT64_TYPE__ long long int
#define __UINT8_TYPE__ unsigned char
#define __UINT16_TYPE__ short unsigned int
#define __UINT32_TYPE__ long unsigned int
#define __UINT64_TYPE__ long long unsigned int
#define __INT_LEAST8_TYPE__ signed char
#define __INT_LEAST16_TYPE__ short int
#define __INT_LEAST32_TYPE__ long int
#define __INT_LEAST64_TYPE__ long long int
#define __UINT_LEAST8_TYPE__ unsigned char
#define __UINT_LEAST16_TYPE__ short unsigned int
#define __UINT_LEAST32_TYPE__ long unsigned int
#define __UINT_LEAST64_TYPE__ long long unsigned int
#define __INT_FAST8_TYPE__ int
#define __INT_FAST16_TYPE__ int
#define __INT_FAST32_TYPE__ long int
#define __INT_FAST64_TYPE__ long long int
#define __UINT_FAST8_TYPE__ unsigned int
#define __UINT_FAST16_TYPE__ unsigned int
#define __UINT_FAST32_TYPE__ long unsigned int
#define __UINT_FAST64_TYPE__ long long unsigned int
#define __INTPTR_TYPE__ int
#define __UINTPTR_TYPE__ unsigned int
#define __has_include(STR) __has_include__(STR)
#define __has_include_next(STR) __has_include_next__(STR)
#define __GXX_ABI_VERSION 1011
#define __SCHAR_MAX__ 0x7f
#define __SHRT_MAX__ 0x7fff
#define __INT_MAX__ 0x7fff
#define __LONG_MAX__ 0x7fffffffL
#define __LONG_LONG_MAX__ 0x7fffffffffffffffLL
#define __WCHAR_MAX__ 0x7fffffffL
#define __WCHAR_MIN__ (-__WCHAR_MAX__ - 1)
#define __WINT_MAX__ 0xffffU
#define __WINT_MIN__ 0U
#define __PTRDIFF_MAX__ 0x7fff
#define __SIZE_MAX__ 0xffffU
#define __SCHAR_WIDTH__ 8
#define __SHRT_WIDTH__ 16
#define __INT_WIDTH__ 16
#define __LONG_WIDTH__ 32
#define __LONG_LONG_WIDTH__ 64
#define __WCHAR_WIDTH__ 32
#define __WINT_WIDTH__ 16
#define __PTRDIFF_WIDTH__ 16
#define __SIZE_WIDTH__ 16
#define __INTMAX_MAX__ 0x7fffffffffffffffLL
#define __INTMAX_C(c) c ## LL
#define __UINTMAX_MAX__ 0xffffffffffffffffULL
#define __UINTMAX_C(c) c ## ULL
#define __INTMAX_WIDTH__ 64
#define __SIG_ATOMIC_MAX__ 0x7fff
#define __SIG_ATOMIC_MIN__ (-__SIG_ATOMIC_MAX__ - 1)
#define __SIG_ATOMIC_WIDTH__ 16
#define __INT8_MAX__ 0x7f
#define __INT16_MAX__ 0x7fff
#define __INT32_MAX__ 0x7fffffffL
#define __INT64_MAX__ 0x7fffffffffffffffLL
#define __UINT8_MAX__ 0xff
#define __UINT16_MAX__ 0xffffU
#define __UINT32_MAX__ 0xffffffffUL
#define __UINT64_MAX__ 0xffffffffffffffffULL
#define __INT_LEAST8_MAX__ 0x7f
#define __INT8_C(c) c
#define __INT_LEAST8_WIDTH__ 8
#define __INT_LEAST16_MAX__ 0x7fff
#define __INT16_C(c) c
#define __INT_LEAST16_WIDTH__ 16
#define __INT_LEAST32_MAX__ 0x7fffffffL
#define __INT32_C(c) c ## L
#define __INT_LEAST32_WIDTH__ 32
#define __INT_LEAST64_MAX__ 0x7fffffffffffffffLL
#define __INT64_C(c) c ## LL
#define __INT_LEAST64_WIDTH__ 64
#define __UINT_LEAST8_MAX__ 0xff
#define __UINT8_C(c) c
#define __UINT_LEAST16_MAX__ 0xffffU
#define __UINT16_C(c) c ## U
#define __UINT_LEAST32_MAX__ 0xffffffffUL
#define __UINT32_C(c) c ## UL
#define __UINT_LEAST64_MAX__ 0xffffffffffffffffULL
#define __UINT64_C(c) c ## ULL
#define __INT_FAST8_MAX__ 0x7fff
#define __INT_FAST8_WIDTH__ 16
#define __INT_FAST16_MAX__ 0x7fff
#define __INT_FAST16_WIDTH__ 16
#define __INT_FAST32_MAX__ 0x7fffffffL
#define __INT_FAST32_WIDTH__ 32
#define __INT_FAST64_MAX__ 0x7fffffffffffffffLL
#define __INT_FAST64_WIDTH__ 64
#define __UINT_FAST8_MAX__ 0xffffU
#define __UINT_FAST16_MAX__ 0xffffU
#define __UINT_FAST32_MAX__ 0xffffffffUL
#define __UINT_FAST64_MAX__ 0xffffffffffffffffULL
#define __INTPTR_MAX__ 0x7fff
#define __INTPTR_WIDTH__ 16
#define __UINTPTR_MAX__ 0xffffU
#define __GCC_IEC_559 0
#define __GCC_IEC_559_COMPLEX 0
#define __FLT_EVAL_METHOD__ 0
#define __FLT_EVAL_METHOD_TS_18661_3__ 0
#define __DEC_EVAL_METHOD__ 2
#define __FLT_RADIX__ 2
#define __FLT_MANT_DIG__ 24
#define __FLT_DIG__ 6
#define __FLT_MIN_EXP__ (-125)
#define __FLT_MIN_10_EXP__ (-37)
#define __FLT_MAX_EXP__ 128
#define __FLT_MAX_10_EXP__ 38
#define __FLT_DECIMAL_DIG__ 9
#define __FLT_MAX__ 3.4028234663852886e+38F
#define __FLT_MIN__ 1.1754943508222875e-38F
#define __FLT_EPSILON__ 1.1920928955078125e-7F
#define __FLT_DENORM_MIN__ 1.4012984643248171e-45F
#define __FLT_HAS_DENORM__ 1
#define __FLT_HAS_INFINITY__ 1
#define __FLT_HAS_QUIET_NAN__ 1
#define __DBL_MANT_DIG__ 53
#define __DBL_DIG__ 15
#define __DBL_MIN_EXP__ (-1021)
#define __DBL_MIN_10_EXP__ (-307)
#define __DBL_MAX_EXP__ 1024
#define __DBL_MAX_10_EXP__ 308
#define __DBL_DECIMAL_DIG__ 17
#define __DBL_MAX__ ((double)1.7976931348623157e+308L)
#define __DBL_MIN__ ((double)2.2250738585072014e-308L)
#define __DBL_EPSILON__ ((double)2.2204460492503131e-16L)
#define __DBL_DENORM_MIN__ ((double)4.9406564584124654e-324L)
#define __DBL_HAS_DENORM__ 1
#define __DBL_HAS_INFINITY__ 1
#define __DBL_HAS_QUIET_NAN__ 1
#define __LDBL_MANT_DIG__ 53
#define __LDBL_DIG__ 15
#define __LDBL_MIN_EXP__ (-1021)
#define __LDBL_MIN_10_EXP__ (-307)
#define __LDBL_MAX_EXP__ 1024
#define __LDBL_MAX_10_EXP__ 308
#define __DECIMAL_DIG__ 17
#define __LDBL_DECIMAL_DIG__ 17
#define __LDBL_MAX__ 1.7976931348623157e+308L
#define __LDBL_MIN__ 2.2250738585072014e-308L
#define __LDBL_EPSILON__ 2.2204460492503131e-16L
#define __LDBL_DENORM_MIN__ 4.9406564584124654e-324L
#define __LDBL_HAS_DENORM__ 1
#define __LDBL_HAS_INFINITY__ 1
#define __LDBL_HAS_QUIET_NAN__ 1
#define __FLT32_MANT_DIG__ 24
#define __FLT32_DIG__ 6
#define __FLT32_MIN_EXP__ (-125)
#define __FLT32_MIN_10_EXP__ (-37)
#define __FLT32_MAX_EXP__ 128
#define __FLT32_MAX_10_EXP__ 38
#define __FLT32_DECIMAL_DIG__ 9
#define __FLT32_MAX__ 3.4028234663852886e+38F32
#define __FLT32_MIN__ 1.1754943508222875e-38F32
#define __FLT32_EPSILON__ 1.1920928955078125e-7F32
#define __FLT32_DENORM_MIN__ 1.4012984643248171e-45F32
#define __FLT32_HAS_DENORM__ 1
#define __FLT32_HAS_INFINITY__ 1
#define __FLT32_HAS_QUIET_NAN__ 1
#define __FLT64_MANT_DIG__ 53
#define __FLT64_DIG__ 15
#define __FLT64_MIN_EXP__ (-1021)
#define __FLT64_MIN_10_EXP__ (-307)
#define __FLT64_MAX_EXP__ 1024
#define __FLT64_MAX_10_EXP__ 308
#define __FLT64_DECIMAL_DIG__ 17
#define __FLT64_MAX__ 1.7976931348623157e+308F64
#define __FLT64_MIN__ 2.2250738585072014e-308F64
#define __FLT64_EPSILON__ 2.2204460492503131e-16F64
#define __FLT64_DENORM_MIN__ 4.9406564584124654e-324F64
#define __FLT64_HAS_DENORM__ 1
#define __FLT64_HAS_INFINITY__ 1
#define __FLT64_HAS_QUIET_NAN__ 1
#define __FLT32X_MANT_DIG__ 53
#define __FLT32X_DIG__ 15
#define __FLT32X_MIN_EXP__ (-1021)
#define __FLT32X_MIN_10_EXP__ (-307)
#define __FLT32X_MAX_EXP__ 1024
#define __FLT32X_MAX_10_EXP__ 308
#define __FLT32X_DECIMAL_DIG__ 17
#define __FLT32X_MAX__ 1.7976931348623157e+308F32x
#define __FLT32X_MIN__ 2.2250738585072014e-308F32x
#define __FLT32X_EPSILON__ 2.2204460492503131e-16F32x
#define __FLT32X_DENORM_MIN__ 4.9406564584124654e-324F32x
#define __FLT32X_HAS_DENORM__ 1
#define __FLT32X_HAS_INFINITY__ 1
#define __FLT32X_HAS_QUIET_NAN__ 1
#define __DEC32_MANT_DIG__ 7
#define __DEC32_MIN_EXP__ (-94)
#define __DEC32_MAX_EXP__ 97
#define __DEC32_MIN__ 1E-95DF
#define __DEC32_MAX__ 9.999999E96DF
#define __DEC32_EPSILON__ 1E-6DF
#define __DEC32_SUBNORMAL_MIN__ 0.000001E-95DF
#define __DEC64_MANT_DIG__ 16
#define __DEC64_MIN_EXP__ (-382)
#define __DEC64_MAX_EXP__ 385
#define __DEC64_MIN__ 1E-383DD
#define __DEC64_MAX__ 9.999999999999999E384DD
#define __DEC64_EPSILON__ 1E-15DD
#define __DEC64_SUBNORMAL_MIN__ 0.000000000000001E-383DD
#define __DEC128_MANT_DIG__ 34
#define __DEC128_MIN_EXP__ (-6142)
#define __DEC128_MAX_EXP__ 6145
#define __DEC128_MIN__ 1E-6143DL
#define __DEC128_MAX__ 9.999999999999999999999999999999999E6144DL
#define __DEC128_EPSILON__ 1E-33DL
#define __DEC128_SUBNORMAL_MIN__ 0.000000000000000000000000000000001E-6143DL
#define __REGISTER_PREFIX__ 
#define __USER_LABEL_PREFIX__ 
#define __GNUC_STDC_INLINE__ 1
#define __NO_INLINE__ 1
#define __STRICT_ANSI__ 1
#define __CHAR_UNSIGNED__ 1
#define __GCC_ATOMIC_BOOL_LOCK_FREE 1
#define __GCC_ATOMIC_CHAR_LOCK_FREE 1
#define __GCC_ATOMIC_CHAR16_T_LOCK_FREE 1
#define __GCC_ATOMIC_CHAR32_T_LOCK_FREE 1
#define __GCC_ATOMIC_WCHAR_T_LOCK_FREE 1
#define __GCC_ATOMIC_SHORT_LOCK_FREE 1
#define __GCC_ATOMIC_INT_LOCK_FREE 1
#define __GCC_ATOMIC_LONG_LOCK_FREE 1
#define __GCC_ATOMIC_LLONG_LOCK_FREE 1
#define __GCC_ATOMIC_TEST_AND_SET_TRUEVAL 1
#define __GCC_ATOMIC_POINTER_LOCK_FREE 1
#define __PRAGMA_REDEFINE_EXTNAME 1
#define __SIZEOF_WCHAR_T__ 4
#define __SIZEOF_WINT_T__ 2
#define __SIZEOF_PTRDIFF_T__ 2
#define NO_TRAMPOLINES 1
#define __MSP430__ 1
#define __MSP430GENERIC__ 1
#define __ELF__ 1
# 1 "<command-line>"
#define PFX_MSP430_ELF 1
# 1 "main.c"

# 1 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/lib/gcc/msp430-elf/7.3.1/include/stdint.h" 1 3 4
# 9 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/lib/gcc/msp430-elf/7.3.1/include/stdint.h" 3 4
# 1 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/stdint.h" 1 3 4
# 10 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/stdint.h" 3 4
#define _STDINT_H 

# 1 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/machine/_default_types.h" 1 3 4





#define _MACHINE__DEFAULT_TYPES_H 

# 1 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/features.h" 1 3 4
# 22 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/features.h" 3 4
#define _SYS_FEATURES_H 





# 1 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/_newlib_version.h" 1 3 4



#define _NEWLIB_VERSION_H__ 1

#define _NEWLIB_VERSION "2.4.0"
#define __NEWLIB__ 2
#define __NEWLIB_MINOR__ 4
#define __NEWLIB_PATCHLEVEL__ 0
# 29 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/features.h" 2 3 4




#define __GNUC_PREREQ(maj,min) ((__GNUC__ << 16) + __GNUC_MINOR__ >= ((maj) << 16) + (min))






#define __GNUC_PREREQ__(ma,mi) __GNUC_PREREQ(ma, mi)
# 244 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/features.h" 3 4
#define __ATFILE_VISIBLE 0





#define __BSD_VISIBLE 0





#define __GNU_VISIBLE 0







#define __ISO_C_VISIBLE 1999







#define __LARGEFILE_VISIBLE 0





#define __MISC_VISIBLE 0
# 294 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/features.h" 3 4
#define __POSIX_VISIBLE 0





#define __SVID_VISIBLE 0
# 314 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/features.h" 3 4
#define __XSI_VISIBLE 0
# 9 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/machine/_default_types.h" 2 3 4






#define __EXP(x) __ ##x ##__
# 27 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/machine/_default_types.h" 3 4

# 27 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/machine/_default_types.h" 3 4
typedef signed char __int8_t;

typedef unsigned char __uint8_t;



#define ___int8_t_defined 1







typedef short int __int16_t;

typedef short unsigned int __uint16_t;



#define ___int16_t_defined 1
# 63 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/machine/_default_types.h" 3 4
typedef long int __int32_t;

typedef long unsigned int __uint32_t;



#define ___int32_t_defined 1
# 89 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/machine/_default_types.h" 3 4
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;



#define ___int64_t_defined 1
# 120 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/machine/_default_types.h" 3 4
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;



#define ___int_least8_t_defined 1
# 146 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/machine/_default_types.h" 3 4
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;



#define ___int_least16_t_defined 1
# 168 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/machine/_default_types.h" 3 4
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;



#define ___int_least32_t_defined 1
# 186 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/machine/_default_types.h" 3 4
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;



#define ___int_least64_t_defined 1







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 214 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/machine/_default_types.h" 3 4
#undef __EXP
# 13 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/stdint.h" 2 3 4
# 1 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/_intsup.h" 1 3 4
# 10 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/_intsup.h" 3 4
#define _SYS__INTSUP_H 





#define __STDINT_EXP(x) __ ##x ##__
# 26 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/_intsup.h" 3 4
#define __have_longlong64 1






#define __have_long32 1
# 49 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
#undef signed
#undef unsigned
#undef char
#undef short
#undef int
#undef __int20
#undef long
#define signed +0
#define unsigned +0
#define char +0
#define short +1
#define __int20 +2
#define int +2
#define long +4
# 78 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/_intsup.h" 3 4
#define _INTPTR_EQ_INT 






#define _INT32_EQ_LONG 







#define __INT8 "hh"
# 104 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/_intsup.h" 3 4
#define __INT16 "h"
# 115 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/_intsup.h" 3 4
#define __INT32 "l"
# 124 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/_intsup.h" 3 4
#define __INT64 "ll"






#define __FAST8 
# 140 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/_intsup.h" 3 4
#define __FAST16 
# 149 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/_intsup.h" 3 4
#define __FAST32 "l"
# 158 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/_intsup.h" 3 4
#define __FAST64 "ll"



#define __LEAST8 "hh"
# 173 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/_intsup.h" 3 4
#define __LEAST16 "h"
# 184 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/_intsup.h" 3 4
#define __LEAST32 "l"
# 193 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/_intsup.h" 3 4
#define __LEAST64 "ll"

#undef signed
#undef unsigned
#undef char
#undef short
#undef int
#undef long
       
       
       
       
       
# 205 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/_intsup.h" 3 4
#undef __int20
       
       
# 14 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/stdint.h" 2 3 4
# 1 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/_stdint.h" 1 3 4
# 10 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/_stdint.h" 3 4
#define _SYS__STDINT_H 
# 19 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/_stdint.h" 3 4
typedef __int8_t int8_t ;
typedef __uint8_t uint8_t ;
#define __int8_t_defined 1



typedef __int16_t int16_t ;
typedef __uint16_t uint16_t ;
#define __int16_t_defined 1



typedef __int32_t int32_t ;
typedef __uint32_t uint32_t ;
#define __int32_t_defined 1



typedef __int64_t int64_t ;
typedef __uint64_t uint64_t ;
#define __int64_t_defined 1


typedef __intptr_t intptr_t;
typedef __uintptr_t uintptr_t;
# 15 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;
#define __int_least8_t_defined 1



typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;
#define __int_least16_t_defined 1



typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;
#define __int_least32_t_defined 1



typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
#define __int_least64_t_defined 1
# 51 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
#define __int_fast8_t_defined 1







  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
#define __int_fast16_t_defined 1







  typedef long int int_fast32_t;
  typedef long unsigned int uint_fast32_t;
#define __int_fast32_t_defined 1







  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
#define __int_fast64_t_defined 1
# 130 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/stdint.h" 3 4
  typedef long long int intmax_t;
# 139 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/stdint.h" 3 4
  typedef long long unsigned int uintmax_t;







#define INTPTR_MIN (-__INTPTR_MAX__ - 1)
#define INTPTR_MAX (__INTPTR_MAX__)
#define UINTPTR_MAX (__UINTPTR_MAX__)
# 171 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/stdint.h" 3 4
#define INT8_MIN (-__INT8_MAX__ - 1)
#define INT8_MAX (__INT8_MAX__)
#define UINT8_MAX (__UINT8_MAX__)







#define INT_LEAST8_MIN (-__INT_LEAST8_MAX__ - 1)
#define INT_LEAST8_MAX (__INT_LEAST8_MAX__)
#define UINT_LEAST8_MAX (__UINT_LEAST8_MAX__)
# 193 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/stdint.h" 3 4
#define INT16_MIN (-__INT16_MAX__ - 1)
#define INT16_MAX (__INT16_MAX__)
#define UINT16_MAX (__UINT16_MAX__)







#define INT_LEAST16_MIN (-__INT_LEAST16_MAX__ - 1)
#define INT_LEAST16_MAX (__INT_LEAST16_MAX__)
#define UINT_LEAST16_MAX (__UINT_LEAST16_MAX__)
# 215 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/stdint.h" 3 4
#define INT32_MIN (-__INT32_MAX__ - 1)
#define INT32_MAX (__INT32_MAX__)
#define UINT32_MAX (__UINT32_MAX__)
# 231 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/stdint.h" 3 4
#define INT_LEAST32_MIN (-__INT_LEAST32_MAX__ - 1)
#define INT_LEAST32_MAX (__INT_LEAST32_MAX__)
#define UINT_LEAST32_MAX (__UINT_LEAST32_MAX__)
# 249 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/stdint.h" 3 4
#define INT64_MIN (-__INT64_MAX__ - 1)
#define INT64_MAX (__INT64_MAX__)
#define UINT64_MAX (__UINT64_MAX__)
# 265 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/stdint.h" 3 4
#define INT_LEAST64_MIN (-__INT_LEAST64_MAX__ - 1)
#define INT_LEAST64_MAX (__INT_LEAST64_MAX__)
#define UINT_LEAST64_MAX (__UINT_LEAST64_MAX__)
# 281 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/stdint.h" 3 4
#define INT_FAST8_MIN (-__INT_FAST8_MAX__ - 1)
#define INT_FAST8_MAX (__INT_FAST8_MAX__)
#define UINT_FAST8_MAX (__UINT_FAST8_MAX__)
# 297 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/stdint.h" 3 4
#define INT_FAST16_MIN (-__INT_FAST16_MAX__ - 1)
#define INT_FAST16_MAX (__INT_FAST16_MAX__)
#define UINT_FAST16_MAX (__UINT_FAST16_MAX__)
# 313 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/stdint.h" 3 4
#define INT_FAST32_MIN (-__INT_FAST32_MAX__ - 1)
#define INT_FAST32_MAX (__INT_FAST32_MAX__)
#define UINT_FAST32_MAX (__UINT_FAST32_MAX__)
# 329 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/stdint.h" 3 4
#define INT_FAST64_MIN (-__INT_FAST64_MAX__ - 1)
#define INT_FAST64_MAX (__INT_FAST64_MAX__)
#define UINT_FAST64_MAX (__UINT_FAST64_MAX__)
# 345 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/stdint.h" 3 4
#define INTMAX_MAX (__INTMAX_MAX__)
#define INTMAX_MIN (-INTMAX_MAX - 1)







#define UINTMAX_MAX (__UINTMAX_MAX__)







#define SIZE_MAX (__SIZE_MAX__)





#define SIG_ATOMIC_MIN (-__STDINT_EXP(INT_MAX) - 1)
#define SIG_ATOMIC_MAX (__STDINT_EXP(INT_MAX))



#define PTRDIFF_MAX (__PTRDIFF_MAX__)



#define PTRDIFF_MIN (-PTRDIFF_MAX - 1)




#define WCHAR_MIN (__WCHAR_MIN__)
# 393 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/stdint.h" 3 4
#define WCHAR_MAX (__WCHAR_MAX__)
# 403 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/stdint.h" 3 4
#define WINT_MAX (__WINT_MAX__)




#define WINT_MIN (__WINT_MIN__)






#define INT8_C(x) __INT8_C(x)
#define UINT8_C(x) __UINT8_C(x)
# 427 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/stdint.h" 3 4
#define INT16_C(x) __INT16_C(x)
#define UINT16_C(x) __UINT16_C(x)
# 439 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/stdint.h" 3 4
#define INT32_C(x) __INT32_C(x)
#define UINT32_C(x) __UINT32_C(x)
# 452 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/stdint.h" 3 4
#define INT64_C(x) __INT64_C(x)
#define UINT64_C(x) __UINT64_C(x)
# 468 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/stdint.h" 3 4
#define INTMAX_C(x) __INTMAX_C(x)
#define UINTMAX_C(x) __UINTMAX_C(x)
# 10 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/lib/gcc/msp430-elf/7.3.1/include/stdint.h" 2 3 4



#define _GCC_WRAP_STDINT_H 
# 3 "main.c" 2
# 1 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/lib/gcc/msp430-elf/7.3.1/include/stdbool.h" 1 3 4
# 29 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/lib/gcc/msp430-elf/7.3.1/include/stdbool.h" 3 4
#define _STDBOOL_H 



#define bool _Bool
#define true 1
#define false 0
# 52 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/lib/gcc/msp430-elf/7.3.1/include/stdbool.h" 3 4
#define __bool_true_false_are_defined 1
# 4 "main.c" 2
# 1 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/stdio.h" 1 3
# 27 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/stdio.h" 3
#define _STDIO_H_ 

# 1 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/_ansi.h" 1 3
# 13 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/_ansi.h" 3
#define _ANSIDECL_H_ 

# 1 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/newlib.h" 1 3







#define __NEWLIB_H__ 1
# 40 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/newlib.h" 3
#define _MB_LEN_MAX 1
# 50 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/newlib.h" 3
#define HAVE_INITFINI_ARRAY 1



#define _ATEXIT_DYNAMIC_ALLOC 1


#define _HAVE_LONG_DOUBLE 1


#define _HAVE_CC_INHIBIT_LOOP_TO_LIBCALL 1


#define _LDBL_EQ_DBL 1


#define _FVWRITE_IN_STREAMIO 1


#define _FSEEK_OPTIMIZATION 1


#define _WIDE_ORIENT 1


#define _UNBUF_STREAM_OPT 1
# 84 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/newlib.h" 3
#define _NANO_FORMATTED_IO 1
# 16 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/_ansi.h" 2 3
# 1 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/config.h" 1 3

#define __SYS_CONFIG_H__ 

# 1 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/machine/ieeefp.h" 1 3
# 379 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/machine/ieeefp.h" 3
#define __IEEE_LITTLE_ENDIAN 
#define __SMALL_BITFIELDS 
# 5 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/config.h" 2 3
# 155 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/config.h" 3
#define _REENT_SMALL 


#define __BUFSIZ__ 256
#define __SMALL_BITFIELDS 




#define _POINTER_INT int
# 227 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/config.h" 3
#undef __RAND_MAX

#define __RAND_MAX 32767
# 246 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/config.h" 3
#define __EXPORT 



#define __IMPORT 






#define _READ_WRITE_RETURN_TYPE int





#define _READ_WRITE_BUFSIZE_TYPE int
# 17 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/_ansi.h" 2 3






#define _HAVE_STDC 
# 44 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/_ansi.h" 3
#define _BEGIN_STD_C 
#define _END_STD_C 
#define _NOTHROW 



#define _PTR void *
#define _AND ,
#define _NOARGS void
#define _CONST const
#define _VOLATILE volatile
#define _SIGNED signed
#define _DOTS , ...
#define _VOID void






#define _EXFUN_NOTHROW(name,proto) name proto _NOTHROW
#define _EXFUN(name,proto) name proto
#define _EXPARM(name,proto) (* name) proto
#define _EXFNPTR(name,proto) (* name) proto

#define _DEFUN(name,arglist,args) name(args)
#define _DEFUN_VOID(name) name(_NOARGS)
#define _CAST_VOID (void)

#define _LONG_DOUBLE long double


#define _PARAMS(paramlist) paramlist
# 101 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/_ansi.h" 3
#define _ATTRIBUTE(attrs) __attribute__ (attrs)
# 127 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/_ansi.h" 3
#define _ELIDABLE_INLINE static __inline__



#define _NOINLINE __attribute__ ((__noinline__))
#define _NOINLINE_STATIC _NOINLINE static
# 30 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/stdio.h" 2 3

#define _FSTDIO 

#define __need_size_t 
#define __need_NULL 
# 1 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/cdefs.h" 1 3
# 41 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/cdefs.h" 3
#define _SYS_CDEFS_H_ 



# 1 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/lib/gcc/msp430-elf/7.3.1/include/stddef.h" 1 3 4
# 187 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/lib/gcc/msp430-elf/7.3.1/include/stddef.h" 3 4
#define __size_t__ 
#define __SIZE_T__ 
#define _SIZE_T 
#define _SYS_SIZE_T_H 
#define _T_SIZE_ 
#define _T_SIZE 
#define __SIZE_T 
#define _SIZE_T_ 
#define _BSD_SIZE_T_ 
#define _SIZE_T_DEFINED_ 
#define _SIZE_T_DEFINED 
#define _BSD_SIZE_T_DEFINED_ 
#define _SIZE_T_DECLARED 
#define ___int_size_t_h 
#define _GCC_SIZE_T 
#define _SIZET_ 







#define __size_t 





typedef unsigned int size_t;
# 238 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/lib/gcc/msp430-elf/7.3.1/include/stddef.h" 3 4
#undef __need_size_t
# 401 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/lib/gcc/msp430-elf/7.3.1/include/stddef.h" 3 4
#undef NULL




#define NULL ((void *)0)





#undef __need_NULL
# 46 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/cdefs.h" 2 3

#define __PMT(args) args
#define __DOTS , ...
#define __THROW 


#define __ASMNAME(cname) __XSTRING (__USER_LABEL_PREFIX__) cname


#define __ptr_t void *
#define __long_double_t long double

#define __attribute_malloc__ 
#define __attribute_pure__ 
#define __attribute_format_strfmon__(a,b) 
#define __flexarr [0]


#define __bounded 
#define __unbounded 
#define __ptrvalue 
# 76 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/cdefs.h" 3
#define __has_extension __has_feature


#define __has_feature(x) 0





#define __has_builtin(x) 0






#define __BEGIN_DECLS 
#define __END_DECLS 
# 105 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/cdefs.h" 3
#define __GNUCLIKE_ASM 3
#define __GNUCLIKE_MATH_BUILTIN_CONSTANTS 



#define __GNUCLIKE___TYPEOF 1
#define __GNUCLIKE___OFFSETOF 1
#define __GNUCLIKE___SECTION 1


#define __GNUCLIKE_CTOR_SECTION_HANDLING 1


#define __GNUCLIKE_BUILTIN_CONSTANT_P 1






#define __GNUCLIKE_BUILTIN_VARARGS 1
#define __GNUCLIKE_BUILTIN_STDARG 1
#define __GNUCLIKE_BUILTIN_VAALIST 1



#define __GNUC_VA_LIST_COMPATIBILITY 1






#define __compiler_membar() __asm __volatile(" " : : : "memory")



#define __GNUCLIKE_BUILTIN_NEXT_ARG 1
#define __GNUCLIKE_MATH_BUILTIN_RELOPS 


#define __GNUCLIKE_BUILTIN_MEMCPY 1


#define __CC_SUPPORTS_INLINE 1
#define __CC_SUPPORTS___INLINE 1
#define __CC_SUPPORTS___INLINE__ 1

#define __CC_SUPPORTS___FUNC__ 1
#define __CC_SUPPORTS_WARNING 1

#define __CC_SUPPORTS_VARADIC_XXX 1

#define __CC_SUPPORTS_DYNAMIC_ARRAY_INIT 1
# 175 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/cdefs.h" 3
#define __P(protos) protos
#define __CONCAT1(x,y) x ## y
#define __CONCAT(x,y) __CONCAT1(x,y)
#define __STRING(x) #x
#define __XSTRING(x) __STRING(x)

#define __const const
#define __signed signed
#define __volatile volatile
# 239 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/cdefs.h" 3
#define __weak_symbol __attribute__((__weak__))
# 252 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/cdefs.h" 3
#define __dead2 __attribute__((__noreturn__))
#define __pure2 __attribute__((__const__))
#define __unused __attribute__((__unused__))
#define __used __attribute__((__used__))
#define __packed __attribute__((__packed__))
#define __aligned(x) __attribute__((__aligned__(x)))
#define __section(x) __attribute__((__section__(x)))


#define __alloc_size(x) __attribute__((__alloc_size__(x)))




#define __alloc_align(x) __attribute__((__alloc_align__(x)))
# 288 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/cdefs.h" 3
#define _Alignas(x) __aligned(x)






#define _Alignof(x) __alignof(x)







#define _Atomic(T) struct { T volatile __val; }





#define _Noreturn __dead2
# 338 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/cdefs.h" 3
#define _Thread_local __thread
# 358 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/cdefs.h" 3
#define __generic(expr,t,yes,no) __builtin_choose_expr( __builtin_types_compatible_p(__typeof(expr), t), yes, no)





#define __malloc_like __attribute__((__malloc__))
#define __pure __attribute__((__pure__))






#define __always_inline __attribute__((__always_inline__))





#define __noinline __attribute__ ((__noinline__))





#define __nonnull(x) __attribute__((__nonnull__(x)))
#define __nonnull_all __attribute__((__nonnull__))






#define __fastcall __attribute__((__fastcall__))
#define __result_use_check __attribute__((__warn_unused_result__))






#define __returns_twice __attribute__((__returns_twice__))





#define __unreachable() __builtin_unreachable()
# 426 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/cdefs.h" 3
#define __restrict restrict
# 459 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/cdefs.h" 3
#define __predict_true(exp) __builtin_expect((exp), 1)
#define __predict_false(exp) __builtin_expect((exp), 0)






#define __sentinel __attribute__((__sentinel__))
#define __exported __attribute__((__visibility__("default")))
#define __hidden __attribute__((__visibility__("hidden")))






#define __offsetof(type,field) offsetof(type, field)
#define __rangeof(type,start,end) (__offsetof(type, end) - __offsetof(type, start))
# 487 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/cdefs.h" 3
#define __containerof(x,s,m) ({ const volatile __typeof(((s *)0)->m) *__x = (x); __DEQUALIFY(s *, (const volatile char *)__x - __offsetof(s, m));})
# 509 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/cdefs.h" 3
#define __printflike(fmtarg,firstvararg) __attribute__((__format__ (__printf__, fmtarg, firstvararg)))

#define __scanflike(fmtarg,firstvararg) __attribute__((__format__ (__scanf__, fmtarg, firstvararg)))

#define __format_arg(fmtarg) __attribute__((__format_arg__ (fmtarg)))
#define __strfmonlike(fmtarg,firstvararg) __attribute__((__format__ (__strfmon__, fmtarg, firstvararg)))

#define __strftimelike(fmtarg,firstvararg) __attribute__((__format__ (__strftime__, fmtarg, firstvararg)))
# 528 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/cdefs.h" 3
#define __gnu_inline __attribute__((__gnu_inline__, __artificial__))
# 542 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/cdefs.h" 3
#define __printf0like(fmtarg,firstvararg) 




#define __strong_reference(sym,aliassym) extern __typeof (sym) aliassym __attribute__ ((__alias__ (#sym)))




#define __weak_reference(sym,alias) __asm__(".weak " #alias); __asm__(".equ " #alias ", " #sym)


#define __warn_references(sym,msg) __asm__(".section .gnu.warning." #sym); __asm__(".asciz \"" msg "\""); __asm__(".previous")



#define __sym_compat(sym,impl,verid) __asm__(".symver " #impl ", " #sym "@" #verid)

#define __sym_default(sym,impl,verid) __asm__(".symver " #impl ", " #sym "@@" #verid)
# 596 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/cdefs.h" 3
#define __FBSDID(s) struct __hack



#define __RCSID(s) struct __hack



#define __RCSID_SOURCE(s) struct __hack



#define __SCCSID(s) struct __hack



#define __COPYRIGHT(s) struct __hack



#define __DECONST(type,var) ((type)(__uintptr_t)(const void *)(var))



#define __DEVOLATILE(type,var) ((type)(__uintptr_t)(volatile void *)(var))



#define __DEQUALIFY(type,var) ((type)(__uintptr_t)(const volatile void *)(var))
# 641 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/cdefs.h" 3
#define __arg_type_tag(arg_kind,arg_idx,type_tag_idx) 
#define __datatype_type_tag(kind,type) 
# 660 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/cdefs.h" 3
#define __lock_annotate(x) 



#define __lockable __lock_annotate(lockable)


#define __locks_exclusive(...) __lock_annotate(exclusive_lock_function(__VA_ARGS__))

#define __locks_shared(...) __lock_annotate(shared_lock_function(__VA_ARGS__))



#define __trylocks_exclusive(...) __lock_annotate(exclusive_trylock_function(__VA_ARGS__))

#define __trylocks_shared(...) __lock_annotate(shared_trylock_function(__VA_ARGS__))



#define __unlocks(...) __lock_annotate(unlock_function(__VA_ARGS__))


#define __asserts_exclusive(...) __lock_annotate(assert_exclusive_lock(__VA_ARGS__))

#define __asserts_shared(...) __lock_annotate(assert_shared_lock(__VA_ARGS__))



#define __requires_exclusive(...) __lock_annotate(exclusive_locks_required(__VA_ARGS__))

#define __requires_shared(...) __lock_annotate(shared_locks_required(__VA_ARGS__))

#define __requires_unlocked(...) __lock_annotate(locks_excluded(__VA_ARGS__))



#define __no_lock_analysis __lock_annotate(no_thread_safety_analysis)


#define __guarded_by(x) __lock_annotate(guarded_by(x))
#define __pt_guarded_by(x) __lock_annotate(pt_guarded_by(x))
# 36 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/stdio.h" 2 3
# 1 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/lib/gcc/msp430-elf/7.3.1/include/stddef.h" 1 3 4
# 39 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/lib/gcc/msp430-elf/7.3.1/include/stddef.h" 3 4
#define _STDDEF_H 
#define _STDDEF_H_ 

#define _ANSI_STDDEF_H 
# 137 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/lib/gcc/msp430-elf/7.3.1/include/stddef.h" 3 4
#define _PTRDIFF_T 
#define _T_PTRDIFF_ 
#define _T_PTRDIFF 
#define __PTRDIFF_T 
#define _PTRDIFF_T_ 
#define _BSD_PTRDIFF_T_ 
#define ___int_ptrdiff_t_h 
#define _GCC_PTRDIFF_T 
#define _PTRDIFF_T_DECLARED 



typedef int ptrdiff_t;
# 161 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/lib/gcc/msp430-elf/7.3.1/include/stddef.h" 3 4
#undef __need_ptrdiff_t
# 238 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/lib/gcc/msp430-elf/7.3.1/include/stddef.h" 3 4
#undef __need_size_t
# 267 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/lib/gcc/msp430-elf/7.3.1/include/stddef.h" 3 4
#define __wchar_t__ 
#define __WCHAR_T__ 
#define _WCHAR_T 
#define _T_WCHAR_ 
#define _T_WCHAR 
#define __WCHAR_T 
#define _WCHAR_T_ 
#define _BSD_WCHAR_T_ 
#define _WCHAR_T_DEFINED_ 
#define _WCHAR_T_DEFINED 
#define _WCHAR_T_H 
#define ___int_wchar_t_h 
#define __INT_WCHAR_T_H 
#define _GCC_WCHAR_T 
#define _WCHAR_T_DECLARED 
# 294 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/lib/gcc/msp430-elf/7.3.1/include/stddef.h" 3 4
#undef _BSD_WCHAR_T_
# 328 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/lib/gcc/msp430-elf/7.3.1/include/stddef.h" 3 4
typedef long int wchar_t;
# 347 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/lib/gcc/msp430-elf/7.3.1/include/stddef.h" 3 4
#undef __need_wchar_t
# 401 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/lib/gcc/msp430-elf/7.3.1/include/stddef.h" 3 4
#undef NULL




#define NULL ((void *)0)





#undef __need_NULL




#define offsetof(TYPE,MEMBER) __builtin_offsetof (TYPE, MEMBER)
# 37 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/stdio.h" 2 3

#define __need___va_list 
# 1 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/lib/gcc/msp430-elf/7.3.1/include/stdarg.h" 1 3 4
# 34 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/lib/gcc/msp430-elf/7.3.1/include/stdarg.h" 3 4
#undef __need___va_list




#define __GNUC_VA_LIST 
typedef __builtin_va_list __gnuc_va_list;
# 40 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/stdio.h" 2 3







# 1 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/reent.h" 1 3
# 11 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/reent.h" 3
#define _SYS_REENT_H_ 

# 1 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/_ansi.h" 1 3
# 14 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/reent.h" 2 3
# 1 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/lib/gcc/msp430-elf/7.3.1/include/stddef.h" 1 3 4
# 15 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/reent.h" 2 3
# 1 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/_types.h" 1 3
# 10 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/_types.h" 3
#define _SYS__TYPES_H 

# 1 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/machine/_types.h" 1 3





#define _MACHINE__TYPES_H 
# 13 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/_types.h" 2 3
# 1 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/lock.h" 1 3

#define __SYS_LOCK_H__ 



typedef int _LOCK_T;
typedef int _LOCK_RECURSIVE_T;



#define __LOCK_INIT(class,lock) static int lock = 0;
#define __LOCK_INIT_RECURSIVE(class,lock) static int lock = 0;
#define __lock_init(lock) (_CAST_VOID 0)
#define __lock_init_recursive(lock) (_CAST_VOID 0)
#define __lock_close(lock) (_CAST_VOID 0)
#define __lock_close_recursive(lock) (_CAST_VOID 0)
#define __lock_acquire(lock) (_CAST_VOID 0)
#define __lock_acquire_recursive(lock) (_CAST_VOID 0)
#define __lock_try_acquire(lock) (_CAST_VOID 0)
#define __lock_try_acquire_recursive(lock) (_CAST_VOID 0)
#define __lock_release(lock) (_CAST_VOID 0)
#define __lock_release_recursive(lock) (_CAST_VOID 0)
# 14 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/_types.h" 2 3


typedef long _off_t;



typedef short __dev_t;



typedef unsigned short __uid_t;


typedef unsigned short __gid_t;



__extension__ typedef long long _off64_t;







typedef long _fpos_t;
# 54 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/_types.h" 3
#define unsigned signed
typedef signed int _ssize_t;
#undef unsigned
# 66 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/_types.h" 3
#define __need_wint_t 
# 1 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/lib/gcc/msp430-elf/7.3.1/include/stddef.h" 1 3 4
# 161 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/lib/gcc/msp430-elf/7.3.1/include/stddef.h" 3 4
#undef __need_ptrdiff_t
# 238 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/lib/gcc/msp430-elf/7.3.1/include/stddef.h" 3 4
#undef __need_size_t
# 347 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/lib/gcc/msp430-elf/7.3.1/include/stddef.h" 3 4
#undef __need_wchar_t




#define _WINT_T 




typedef unsigned int wint_t;

#undef __need_wint_t
# 401 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/lib/gcc/msp430-elf/7.3.1/include/stddef.h" 3 4
#undef NULL




#define NULL ((void *)0)





#undef __need_NULL




#define offsetof(TYPE,MEMBER) __builtin_offsetof (TYPE, MEMBER)
# 68 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/_types.h" 2 3



typedef struct
{
  int __count;
  union
  {
    wint_t __wch;
    unsigned char __wchb[4];
  } __value;
} _mbstate_t;



typedef _LOCK_RECURSIVE_T _flock_t;




typedef void *_iconv_t;
# 16 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/reent.h" 2 3

#define _NULL 0



#define __Long long
typedef unsigned long __ULong;
# 38 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/reent.h" 3
struct _reent;






struct _Bigint
{
  struct _Bigint *_next;
  int _k, _maxwds, _sign, _wds;
  __ULong _x[1];
};


struct __tm
{
  int __tm_sec;
  int __tm_min;
  int __tm_hour;
  int __tm_mday;
  int __tm_mon;
  int __tm_year;
  int __tm_wday;
  int __tm_yday;
  int __tm_isdst;
};





#define _ATEXIT_SIZE 32

struct _on_exit_args {
 void * _fnargs[32];
 void * _dso_handle[32];

 __ULong _fntypes;


 __ULong _is_cxa;
};


struct _atexit {
 struct _atexit *_next;
 int _ind;
 void (*_fns[32])(void);
        struct _on_exit_args * _on_exit_args_ptr;
};
#define _ATEXIT_INIT {_NULL, 0, {_NULL}, _NULL}
# 104 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/reent.h" 3
#define _REENT_INIT_ATEXIT _NULL, _ATEXIT_INIT,
# 115 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/reent.h" 3
struct __sbuf {
 unsigned char *_base;
 int _size;
};
# 151 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/reent.h" 3
struct __sFILE_fake {
  unsigned char *_p;
  int _r;
  int _w;
  short _flags;
  short _file;
  struct __sbuf _bf;
  int _lbfsize;

  struct _reent *_data;
};




extern void __sinit (struct _reent *);

#define _REENT_SMALL_CHECK_INIT(ptr) do { if ((ptr) && !(ptr)->__sdidinit) __sinit (ptr); } while (0)
# 179 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/reent.h" 3
struct __sFILE {
  unsigned char *_p;
  int _r;
  int _w;
  short _flags;
  short _file;
  struct __sbuf _bf;
  int _lbfsize;


  struct _reent *_data;



  void * _cookie;

  int (* _read) (struct _reent *, void *, char *, int)
                                          ;
  int (* _write) (struct _reent *, void *, const char *, int)

                                   ;
  _fpos_t (* _seek) (struct _reent *, void *, _fpos_t, int);
  int (* _close) (struct _reent *, void *);


  struct __sbuf _ub;
  unsigned char *_up;
  int _ur;


  unsigned char _ubuf[3];
  unsigned char _nbuf[1];


  struct __sbuf _lb;


  int _blksize;
  _off_t _offset;






  _flock_t _lock;

  _mbstate_t _mbstate;
  int _flags2;
};
# 285 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/reent.h" 3
typedef struct __sFILE __FILE;



struct _glue
{
  struct _glue *_next;
  int _niobs;
  __FILE *_iobs;
};
# 310 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/reent.h" 3
#define _RAND48_SEED_0 (0x330e)
#define _RAND48_SEED_1 (0xabcd)
#define _RAND48_SEED_2 (0x1234)
#define _RAND48_MULT_0 (0xe66d)
#define _RAND48_MULT_1 (0xdeec)
#define _RAND48_MULT_2 (0x0005)
#define _RAND48_ADD (0x000b)
struct _rand48 {
  unsigned short _seed[3];
  unsigned short _mult[3];
  unsigned short _add;


  __extension__ unsigned long long _rand_next;

};


#define _REENT_EMERGENCY_SIZE 25
#define _REENT_ASCTIME_SIZE 26
#define _REENT_SIGNAL_SIZE 24
# 342 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/reent.h" 3
struct _mprec
{

  struct _Bigint *_result;
  int _result_k;
  struct _Bigint *_p5s;
  struct _Bigint **_freelist;
};


struct _misc_reent
{

  char *_strtok_last;
  _mbstate_t _mblen_state;
  _mbstate_t _wctomb_state;
  _mbstate_t _mbtowc_state;
  char _l64a_buf[8];
  int _getdate_err;
  _mbstate_t _mbrlen_state;
  _mbstate_t _mbrtowc_state;
  _mbstate_t _mbsrtowcs_state;
  _mbstate_t _wcrtomb_state;
  _mbstate_t _wcsrtombs_state;
};



struct _reent
{


  int _errno;




  __FILE *_stdin, *_stdout, *_stderr;

  int _inc;

  char *_emergency;

  int __sdidinit;

  int _current_category;
  const char *_current_locale;

  struct _mprec *_mp;

  void (* __cleanup) (struct _reent *);

  int _gamma_signgam;


  int _cvtlen;
  char *_cvtbuf;

  struct _rand48 *_r48;
  struct __tm *_localtime_buf;
  char *_asctime_buf;


  void (**(_sig_func))(int);



  struct _atexit *_atexit;
  struct _atexit _atexit0;


  struct _glue __sglue;
  __FILE *__sf;
  struct _misc_reent *_misc;
  char *_signal_buf;
};

extern const struct __sFILE_fake __sf_fake_stdin;
extern const struct __sFILE_fake __sf_fake_stdout;
extern const struct __sFILE_fake __sf_fake_stderr;

#define _REENT_INIT(var) { 0, (__FILE *)&__sf_fake_stdin, (__FILE *)&__sf_fake_stdout, (__FILE *)&__sf_fake_stderr, 0, _NULL, 0, 0, "C", _NULL, _NULL, 0, 0, _NULL, _NULL, _NULL, _NULL, _NULL, _REENT_INIT_ATEXIT {_NULL, 0, _NULL}, _NULL, _NULL, _NULL }
# 449 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/reent.h" 3
#define _REENT_INIT_PTR_ZEROED(var) { (var)->_stdin = (__FILE *)&__sf_fake_stdin; (var)->_stdout = (__FILE *)&__sf_fake_stdout; (var)->_stderr = (__FILE *)&__sf_fake_stderr; (var)->_current_locale = "C"; }
# 461 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/reent.h" 3
#define __reent_assert(x) ((void)0)







#define _REENT_CHECK(var,what,type,size,init) do { struct _reent *_r = (var); if (_r->what == NULL) { _r->what = (type)malloc(size); __reent_assert(_r->what); init; } } while (0)
# 478 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/reent.h" 3
#define _REENT_CHECK_TM(var) _REENT_CHECK(var, _localtime_buf, struct __tm *, sizeof *((var)->_localtime_buf), )



#define _REENT_CHECK_ASCTIME_BUF(var) _REENT_CHECK(var, _asctime_buf, char *, _REENT_ASCTIME_SIZE, memset((var)->_asctime_buf, 0, _REENT_ASCTIME_SIZE))




#define _REENT_INIT_RAND48(var) do { struct _reent *_r = (var); _r->_r48->_seed[0] = _RAND48_SEED_0; _r->_r48->_seed[1] = _RAND48_SEED_1; _r->_r48->_seed[2] = _RAND48_SEED_2; _r->_r48->_mult[0] = _RAND48_MULT_0; _r->_r48->_mult[1] = _RAND48_MULT_1; _r->_r48->_mult[2] = _RAND48_MULT_2; _r->_r48->_add = _RAND48_ADD; _r->_r48->_rand_next = 1; } while (0)
# 498 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/reent.h" 3
#define _REENT_CHECK_RAND48(var) _REENT_CHECK(var, _r48, struct _rand48 *, sizeof *((var)->_r48), _REENT_INIT_RAND48((var)))


#define _REENT_INIT_MP(var) do { struct _reent *_r = (var); _r->_mp->_result_k = 0; _r->_mp->_result = _r->_mp->_p5s = _NULL; _r->_mp->_freelist = _NULL; } while (0)





#define _REENT_CHECK_MP(var) _REENT_CHECK(var, _mp, struct _mprec *, sizeof *((var)->_mp), _REENT_INIT_MP(var))


#define _REENT_CHECK_EMERGENCY(var) _REENT_CHECK(var, _emergency, char *, _REENT_EMERGENCY_SIZE, )


#define _REENT_INIT_MISC(var) do { struct _reent *_r = (var); _r->_misc->_strtok_last = _NULL; _r->_misc->_mblen_state.__count = 0; _r->_misc->_mblen_state.__value.__wch = 0; _r->_misc->_wctomb_state.__count = 0; _r->_misc->_wctomb_state.__value.__wch = 0; _r->_misc->_mbtowc_state.__count = 0; _r->_misc->_mbtowc_state.__value.__wch = 0; _r->_misc->_mbrlen_state.__count = 0; _r->_misc->_mbrlen_state.__value.__wch = 0; _r->_misc->_mbrtowc_state.__count = 0; _r->_misc->_mbrtowc_state.__value.__wch = 0; _r->_misc->_mbsrtowcs_state.__count = 0; _r->_misc->_mbsrtowcs_state.__value.__wch = 0; _r->_misc->_wcrtomb_state.__count = 0; _r->_misc->_wcrtomb_state.__value.__wch = 0; _r->_misc->_wcsrtombs_state.__count = 0; _r->_misc->_wcsrtombs_state.__value.__wch = 0; _r->_misc->_l64a_buf[0] = '\0'; _r->_misc->_getdate_err = 0; } while (0)
# 535 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/reent.h" 3
#define _REENT_CHECK_MISC(var) _REENT_CHECK(var, _misc, struct _misc_reent *, sizeof *((var)->_misc), _REENT_INIT_MISC(var))


#define _REENT_CHECK_SIGNAL_BUF(var) _REENT_CHECK(var, _signal_buf, char *, _REENT_SIGNAL_SIZE, )


#define _REENT_SIGNGAM(ptr) ((ptr)->_gamma_signgam)
#define _REENT_RAND_NEXT(ptr) ((ptr)->_r48->_rand_next)
#define _REENT_RAND48_SEED(ptr) ((ptr)->_r48->_seed)
#define _REENT_RAND48_MULT(ptr) ((ptr)->_r48->_mult)
#define _REENT_RAND48_ADD(ptr) ((ptr)->_r48->_add)
#define _REENT_MP_RESULT(ptr) ((ptr)->_mp->_result)
#define _REENT_MP_RESULT_K(ptr) ((ptr)->_mp->_result_k)
#define _REENT_MP_P5S(ptr) ((ptr)->_mp->_p5s)
#define _REENT_MP_FREELIST(ptr) ((ptr)->_mp->_freelist)
#define _REENT_ASCTIME_BUF(ptr) ((ptr)->_asctime_buf)
#define _REENT_TM(ptr) ((ptr)->_localtime_buf)
#define _REENT_EMERGENCY(ptr) ((ptr)->_emergency)
#define _REENT_STRTOK_LAST(ptr) ((ptr)->_misc->_strtok_last)
#define _REENT_MBLEN_STATE(ptr) ((ptr)->_misc->_mblen_state)
#define _REENT_MBTOWC_STATE(ptr) ((ptr)->_misc->_mbtowc_state)
#define _REENT_WCTOMB_STATE(ptr) ((ptr)->_misc->_wctomb_state)
#define _REENT_MBRLEN_STATE(ptr) ((ptr)->_misc->_mbrlen_state)
#define _REENT_MBRTOWC_STATE(ptr) ((ptr)->_misc->_mbrtowc_state)
#define _REENT_MBSRTOWCS_STATE(ptr) ((ptr)->_misc->_mbsrtowcs_state)
#define _REENT_WCRTOMB_STATE(ptr) ((ptr)->_misc->_wcrtomb_state)
#define _REENT_WCSRTOMBS_STATE(ptr) ((ptr)->_misc->_wcsrtombs_state)
#define _REENT_L64A_BUF(ptr) ((ptr)->_misc->_l64a_buf)
#define _REENT_GETDATE_ERR_P(ptr) (&((ptr)->_misc->_getdate_err))
#define _REENT_SIGNAL_BUF(ptr) ((ptr)->_signal_buf)
# 746 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/reent.h" 3
#define _REENT_INIT_PTR(var) { memset((var), 0, sizeof(*(var))); _REENT_INIT_PTR_ZEROED(var); }







#define _Kmax (sizeof (size_t) << 3)







#define __ATTRIBUTE_IMPURE_PTR__ 


extern struct _reent *_impure_ptr ;
extern struct _reent *const _global_impure_ptr ;

void _reclaim_reent (struct _reent *);
# 778 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/reent.h" 3
#define _REENT _impure_ptr


#define _GLOBAL_REENT _global_impure_ptr





#define _GLOBAL_ATEXIT (_GLOBAL_REENT->_atexit)
# 48 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/stdio.h" 2 3
# 1 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/types.h" 1 3
# 28 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/types.h" 3
typedef __uint8_t u_int8_t;


typedef __uint16_t u_int16_t;


typedef __uint32_t u_int32_t;


typedef __uint64_t u_int64_t;
# 58 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/types.h" 3
#define _SYS_TYPES_H 
# 68 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/types.h" 3
# 1 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/lib/gcc/msp430-elf/7.3.1/include/stddef.h" 1 3 4
# 69 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/types.h" 2 3
# 1 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/machine/types.h" 1 3

#define _MACHTYPES_H_ 
# 13 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/machine/types.h" 3
#define _CLOCK_T_ unsigned long
#define _TIME_T_ long
#define _CLOCKID_T_ unsigned long
#define _TIMER_T_ unsigned long


typedef long int __off_t;
typedef int __pid_t;

__extension__ typedef long long int __loff_t;





typedef long __suseconds_t;
# 70 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/types.h" 2 3
# 79 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/types.h" 3
#define _ST_INT32 __attribute__ ((__mode__ (__SI__)))
# 120 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/types.h" 3
typedef unsigned long clock_t;
#define __clock_t_defined 



typedef long time_t;
#define __time_t_defined 



typedef long daddr_t;
#define __daddr_t_defined 


typedef char * caddr_t;
#define __caddr_t_defined 







typedef unsigned short ino_t;
# 172 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/types.h" 3
typedef _off_t off_t;
typedef __dev_t dev_t;
typedef __uid_t uid_t;
typedef __gid_t gid_t;





typedef int pid_t;







typedef long key_t;



typedef _ssize_t ssize_t;
#define _SSIZE_T_DECLARED 
# 209 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/types.h" 3
typedef unsigned int mode_t __attribute__ ((__mode__ (__SI__)));




typedef unsigned short nlink_t;

#undef __MS_types__
#undef _ST_INT32



typedef unsigned long clockid_t;
#define __clockid_t_defined 



typedef unsigned long timer_t;
#define __timer_t_defined 


typedef unsigned long useconds_t;


typedef __suseconds_t suseconds_t;
#define _SUSECONDS_T_DECLARED 


typedef __int64_t sbintime_t;
# 472 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/types.h" 3
#undef __need_inttypes
# 49 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/stdio.h" 2 3




typedef __FILE FILE;
#define __FILE_defined 





typedef _fpos_t fpos_t;





# 1 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/stdio.h" 1 3

#define _NEWLIB_STDIO_H 
# 13 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/stdio.h" 3
#define _flockfile(fp) (((fp)->_flags & __SSTR) ? 0 : __lock_acquire_recursive((fp)->_lock))







#define _funlockfile(fp) (((fp)->_flags & __SSTR) ? 0 : __lock_release_recursive((fp)->_lock))
# 67 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/stdio.h" 2 3

#define __SLBF 0x0001
#define __SNBF 0x0002
#define __SRD 0x0004
#define __SWR 0x0008

#define __SRW 0x0010
#define __SEOF 0x0020
#define __SERR 0x0040
#define __SMBF 0x0080
#define __SAPP 0x0100
#define __SSTR 0x0200
#define __SOPT 0x0400
#define __SNPT 0x0800
#define __SOFF 0x1000
#define __SORD 0x2000



#define __SL64 0x8000


#define __SNLK 0x0001
#define __SWID 0x2000
# 101 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/stdio.h" 3
#define _IOFBF 0
#define _IOLBF 1
#define _IONBF 2

#define EOF (-1)


#define BUFSIZ __BUFSIZ__







#define FOPEN_MAX 20





#define FILENAME_MAX 1024





#define L_tmpnam FILENAME_MAX







#define SEEK_SET 0


#define SEEK_CUR 1


#define SEEK_END 2


#define TMP_MAX 26

#define stdin (_REENT->_stdin)
#define stdout (_REENT->_stdout)
#define stderr (_REENT->_stderr)

#define _stdin_r(x) ((x)->_stdin)
#define _stdout_r(x) ((x)->_stdout)
#define _stderr_r(x) ((x)->_stderr)







#define __VALIST __gnuc_va_list





FILE * tmpfile (void);
char * tmpnam (char *);



int fclose (FILE *);
int fflush (FILE *);
FILE * freopen (const char *restrict, const char *restrict, FILE *restrict);
void setbuf (FILE *restrict, char *restrict);
int setvbuf (FILE *restrict, char *restrict, int, size_t);
int fprintf (FILE *restrict, const char *restrict, ...) __attribute__ ((__format__ (__printf__, 2, 3)))
                                                            ;
int fscanf (FILE *restrict, const char *restrict, ...) __attribute__ ((__format__ (__scanf__, 2, 3)))
                                                           ;
int printf (const char *restrict, ...) __attribute__ ((__format__ (__printf__, 1, 2)))
                                                            ;
int scanf (const char *restrict, ...) __attribute__ ((__format__ (__scanf__, 1, 2)))
                                                           ;
int sscanf (const char *restrict, const char *restrict, ...) __attribute__ ((__format__ (__scanf__, 2, 3)))
                                                           ;
int vfprintf (FILE *restrict, const char *restrict, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 2, 0)))
                                                            ;
int vprintf (const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 1, 0)))
                                                            ;
int vsprintf (char *restrict, const char *restrict, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 2, 0)))
                                                            ;
int fgetc (FILE *);
char * fgets (char *restrict, int, FILE *restrict);
int fputc (int, FILE *);
int fputs (const char *restrict, FILE *restrict);
int getc (FILE *);
int getchar (void);
char * gets (char *);
int putc (int, FILE *);
int putchar (int);
int puts (const char *);
int ungetc (int, FILE *);
size_t fread (void * restrict, size_t _size, size_t _n, FILE *restrict);
size_t fwrite (const void * restrict , size_t _size, size_t _n, FILE *);



int fgetpos (FILE *restrict, fpos_t *restrict);

int fseek (FILE *, long, int);



int fsetpos (FILE *, const fpos_t *);

long ftell ( FILE *);
void rewind (FILE *);
void clearerr (FILE *);
int feof (FILE *);
int ferror (FILE *);
void perror (const char *);

FILE * fopen (const char *restrict _name, const char *restrict _type);
int sprintf (char *restrict, const char *restrict, ...) __attribute__ ((__format__ (__printf__, 2, 3)))
                                                            ;
int remove (const char *);
int rename (const char *, const char *);
# 247 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/stdio.h" 3
int snprintf (char *restrict, size_t, const char *restrict, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
int vsnprintf (char *restrict, size_t, const char *restrict, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
int vfscanf (FILE *restrict, const char *restrict, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 2, 0)))
                                                           ;
int vscanf (const char *, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 1, 0)))
                                                           ;
int vsscanf (const char *restrict, const char *restrict, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 2, 0)))
                                                           ;
# 374 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/stdio.h" 3
int _asiprintf_r (struct _reent *, char **, const char *, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
char * _asniprintf_r (struct _reent *, char *, size_t *, const char *, ...) __attribute__ ((__format__ (__printf__, 4, 5)))
                                                            ;
char * _asnprintf_r (struct _reent *, char *restrict, size_t *restrict, const char *restrict, ...) __attribute__ ((__format__ (__printf__, 4, 5)))
                                                            ;
int _asprintf_r (struct _reent *, char **restrict, const char *restrict, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
int _diprintf_r (struct _reent *, int, const char *, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
int _dprintf_r (struct _reent *, int, const char *restrict, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
int _fclose_r (struct _reent *, FILE *);
int _fcloseall_r (struct _reent *);
FILE * _fdopen_r (struct _reent *, int, const char *);
int _fflush_r (struct _reent *, FILE *);
int _fgetc_r (struct _reent *, FILE *);
int _fgetc_unlocked_r (struct _reent *, FILE *);
char * _fgets_r (struct _reent *, char *restrict, int, FILE *restrict);
char * _fgets_unlocked_r (struct _reent *, char *restrict, int, FILE *restrict);




int _fgetpos_r (struct _reent *, FILE *, fpos_t *);
int _fsetpos_r (struct _reent *, FILE *, const fpos_t *);

int _fiprintf_r (struct _reent *, FILE *, const char *, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
int _fiscanf_r (struct _reent *, FILE *, const char *, ...) __attribute__ ((__format__ (__scanf__, 3, 4)))
                                                           ;
FILE * _fmemopen_r (struct _reent *, void *restrict, size_t, const char *restrict);
FILE * _fopen_r (struct _reent *, const char *restrict, const char *restrict);
FILE * _freopen_r (struct _reent *, const char *restrict, const char *restrict, FILE *restrict);
int _fprintf_r (struct _reent *, FILE *restrict, const char *restrict, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
int _fpurge_r (struct _reent *, FILE *);
int _fputc_r (struct _reent *, int, FILE *);
int _fputc_unlocked_r (struct _reent *, int, FILE *);
int _fputs_r (struct _reent *, const char *restrict, FILE *restrict);
int _fputs_unlocked_r (struct _reent *, const char *restrict, FILE *restrict);
size_t _fread_r (struct _reent *, void * restrict, size_t _size, size_t _n, FILE *restrict);
size_t _fread_unlocked_r (struct _reent *, void * restrict, size_t _size, size_t _n, FILE *restrict);
int _fscanf_r (struct _reent *, FILE *restrict, const char *restrict, ...) __attribute__ ((__format__ (__scanf__, 3, 4)))
                                                           ;
int _fseek_r (struct _reent *, FILE *, long, int);
int _fseeko_r (struct _reent *, FILE *, _off_t, int);
long _ftell_r (struct _reent *, FILE *);
_off_t _ftello_r (struct _reent *, FILE *);
void _rewind_r (struct _reent *, FILE *);
size_t _fwrite_r (struct _reent *, const void * restrict, size_t _size, size_t _n, FILE *restrict);
size_t _fwrite_unlocked_r (struct _reent *, const void * restrict, size_t _size, size_t _n, FILE *restrict);
int _getc_r (struct _reent *, FILE *);
int _getc_unlocked_r (struct _reent *, FILE *);
int _getchar_r (struct _reent *);
int _getchar_unlocked_r (struct _reent *);
char * _gets_r (struct _reent *, char *);
int _iprintf_r (struct _reent *, const char *, ...) __attribute__ ((__format__ (__printf__, 2, 3)))
                                                            ;
int _iscanf_r (struct _reent *, const char *, ...) __attribute__ ((__format__ (__scanf__, 2, 3)))
                                                           ;
FILE * _open_memstream_r (struct _reent *, char **, size_t *);
void _perror_r (struct _reent *, const char *);
int _printf_r (struct _reent *, const char *restrict, ...) __attribute__ ((__format__ (__printf__, 2, 3)))
                                                            ;
int _putc_r (struct _reent *, int, FILE *);
int _putc_unlocked_r (struct _reent *, int, FILE *);
int _putchar_unlocked_r (struct _reent *, int);
int _putchar_r (struct _reent *, int);
int _puts_r (struct _reent *, const char *);
int _remove_r (struct _reent *, const char *);
int _rename_r (struct _reent *, const char *_old, const char *_new)
                                          ;
int _scanf_r (struct _reent *, const char *restrict, ...) __attribute__ ((__format__ (__scanf__, 2, 3)))
                                                           ;
int _siprintf_r (struct _reent *, char *, const char *, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
int _siscanf_r (struct _reent *, const char *, const char *, ...) __attribute__ ((__format__ (__scanf__, 3, 4)))
                                                           ;
int _sniprintf_r (struct _reent *, char *, size_t, const char *, ...) __attribute__ ((__format__ (__printf__, 4, 5)))
                                                            ;
int _snprintf_r (struct _reent *, char *restrict, size_t, const char *restrict, ...) __attribute__ ((__format__ (__printf__, 4, 5)))
                                                            ;
int _sprintf_r (struct _reent *, char *restrict, const char *restrict, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
int _sscanf_r (struct _reent *, const char *restrict, const char *restrict, ...) __attribute__ ((__format__ (__scanf__, 3, 4)))
                                                           ;
char * _tempnam_r (struct _reent *, const char *, const char *);
FILE * _tmpfile_r (struct _reent *);
char * _tmpnam_r (struct _reent *, char *);
int _ungetc_r (struct _reent *, int, FILE *);
int _vasiprintf_r (struct _reent *, char **, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
char * _vasniprintf_r (struct _reent*, char *, size_t *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 4, 0)))
                                                            ;
char * _vasnprintf_r (struct _reent*, char *, size_t *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 4, 0)))
                                                            ;
int _vasprintf_r (struct _reent *, char **, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
int _vdiprintf_r (struct _reent *, int, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
int _vdprintf_r (struct _reent *, int, const char *restrict, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
int _vfiprintf_r (struct _reent *, FILE *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
int _vfiscanf_r (struct _reent *, FILE *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 3, 0)))
                                                           ;
int _vfprintf_r (struct _reent *, FILE *restrict, const char *restrict, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
int _vfscanf_r (struct _reent *, FILE *restrict, const char *restrict, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 3, 0)))
                                                           ;
int _viprintf_r (struct _reent *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 2, 0)))
                                                            ;
int _viscanf_r (struct _reent *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 2, 0)))
                                                           ;
int _vprintf_r (struct _reent *, const char *restrict, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 2, 0)))
                                                            ;
int _vscanf_r (struct _reent *, const char *restrict, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 2, 0)))
                                                           ;
int _vsiprintf_r (struct _reent *, char *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
int _vsiscanf_r (struct _reent *, const char *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 3, 0)))
                                                           ;
int _vsniprintf_r (struct _reent *, char *, size_t, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 4, 0)))
                                                            ;
int _vsnprintf_r (struct _reent *, char *restrict, size_t, const char *restrict, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 4, 0)))
                                                            ;
int _vsprintf_r (struct _reent *, char *restrict, const char *restrict, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
int _vsscanf_r (struct _reent *, const char *restrict, const char *restrict, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 3, 0)))
                                                           ;



int fpurge (FILE *);
ssize_t __getdelim (char **, size_t *, int, FILE *);
ssize_t __getline (char **, size_t *, FILE *);
# 555 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/stdio.h" 3
int __srget_r (struct _reent *, FILE *);
int __swbuf_r (struct _reent *, int, FILE *);
# 632 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/stdio.h" 3
#define __sgetc_raw_r(__ptr,__f) (--(__f)->_r < 0 ? __srget_r(__ptr, __f) : (int)(*(__f)->_p++))
# 661 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/stdio.h" 3
#define __sgetc_r(__ptr,__p) __sgetc_raw_r(__ptr, __p)



static __inline__ int __sputc_r(struct _reent *_ptr, int _c, FILE *_p) {




 if (--_p->_w >= 0 || (_p->_w >= _p->_lbfsize && (char)_c != '\n'))
  return (*_p->_p++ = _c);
 else
  return (__swbuf_r(_ptr, _c, _p));
}
# 697 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/stdio.h" 3
#define __sfeof(p) ((int)(((p)->_flags & __SEOF) != 0))
#define __sferror(p) ((int)(((p)->_flags & __SERR) != 0))
#define __sclearerr(p) ((void)((p)->_flags &= ~(__SERR|__SEOF)))
#define __sfileno(p) ((p)->_file)
# 720 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/stdio.h" 3
#define getc(fp) __sgetc_r(_REENT, fp)
#define putc(x,fp) __sputc_r(_REENT, x, fp)
# 740 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/stdio.h" 3
#define getchar() getc(stdin)
#define putchar(x) putc(x, stdout)







# 5 "main.c" 2
# 1 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/stdlib.h" 1 3







#define _STDLIB_H_ 

# 1 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/machine/ieeefp.h" 1 3
# 11 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/stdlib.h" 2 3


#define __need_size_t 
#define __need_wchar_t 
#define __need_NULL 
# 1 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/lib/gcc/msp430-elf/7.3.1/include/stddef.h" 1 3 4
# 161 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/lib/gcc/msp430-elf/7.3.1/include/stddef.h" 3 4
#undef __need_ptrdiff_t
# 238 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/lib/gcc/msp430-elf/7.3.1/include/stddef.h" 3 4
#undef __need_size_t
# 347 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/lib/gcc/msp430-elf/7.3.1/include/stddef.h" 3 4
#undef __need_wchar_t
# 401 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/lib/gcc/msp430-elf/7.3.1/include/stddef.h" 3 4
#undef NULL




#define NULL ((void *)0)





#undef __need_NULL




#define offsetof(TYPE,MEMBER) __builtin_offsetof (TYPE, MEMBER)
# 17 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/stdlib.h" 2 3



# 1 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/machine/stdlib.h" 1 3

#define _MACHSTDLIB_H_ 
# 21 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/stdlib.h" 2 3
# 29 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/stdlib.h" 3


typedef struct
{
  int quot;
  int rem;
} div_t;

typedef struct
{
  long quot;
  long rem;
} ldiv_t;


typedef struct
{
  long long int quot;
  long long int rem;
} lldiv_t;



#define __compar_fn_t_defined 
typedef int (*__compar_fn_t) (const void *, const void *);


#define EXIT_FAILURE 1
#define EXIT_SUCCESS 0

#define RAND_MAX __RAND_MAX

int __locale_mb_cur_max (void);

#define MB_CUR_MAX __locale_mb_cur_max()

void abort (void) __attribute__ ((__noreturn__));
int abs (int);





int atexit (void (*__func)(void));
double atof (const char *__nptr);



int atoi (const char *__nptr);
int _atoi_r (struct _reent *, const char *__nptr);
long atol (const char *__nptr);
long _atol_r (struct _reent *, const char *__nptr);
void * bsearch (const void * __key, const void * __base, size_t __nmemb, size_t __size, __compar_fn_t _compar)



                                ;
void * calloc (size_t __nmemb, size_t __size) ;
div_t div (int __numer, int __denom);
void exit (int __status) __attribute__ ((__noreturn__));
void free (void *) ;
char * getenv (const char *__string);
char * _getenv_r (struct _reent *, const char *__string);
char * _findenv (const char *, int *);
char * _findenv_r (struct _reent *, const char *, int *);




long labs (long);
ldiv_t ldiv (long __numer, long __denom);
void * malloc (size_t __size) ;
int mblen (const char *, size_t);
int _mblen_r (struct _reent *, const char *, size_t, _mbstate_t *);
int mbtowc (wchar_t *restrict, const char *restrict, size_t);
int _mbtowc_r (struct _reent *, wchar_t *restrict, const char *restrict, size_t, _mbstate_t *);
int wctomb (char *, wchar_t);
int _wctomb_r (struct _reent *, char *, wchar_t, _mbstate_t *);
size_t mbstowcs (wchar_t *restrict, const char *restrict, size_t);
size_t _mbstowcs_r (struct _reent *, wchar_t *restrict, const char *restrict, size_t, _mbstate_t *);
size_t wcstombs (char *restrict, const wchar_t *restrict, size_t);
size_t _wcstombs_r (struct _reent *, char *restrict, const wchar_t *restrict, size_t, _mbstate_t *);
# 129 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/stdlib.h" 3
char * _mkdtemp_r (struct _reent *, char *);
int _mkostemp_r (struct _reent *, char *, int);
int _mkostemps_r (struct _reent *, char *, int, int);
int _mkstemp_r (struct _reent *, char *);
int _mkstemps_r (struct _reent *, char *, int);
char * _mktemp_r (struct _reent *, char *) __attribute__ ((__deprecated__("the use of `mktemp' is dangerous; use `mkstemp' instead")));
void qsort (void * __base, size_t __nmemb, size_t __size, __compar_fn_t _compar);
int rand (void);
void * realloc (void * __r, size_t __size) ;
# 147 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/stdlib.h" 3
void srand (unsigned __seed);
double strtod (const char *restrict __n, char **restrict __end_PTR);
double _strtod_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR);

float strtof (const char *restrict __n, char **restrict __end_PTR);







long strtol (const char *restrict __n, char **restrict __end_PTR, int __base);
long _strtol_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR, int __base);
unsigned long strtoul (const char *restrict __n, char **restrict __end_PTR, int __base);
unsigned long _strtoul_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR, int __base);

int system (const char *__string);
# 175 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/stdlib.h" 3
void _Exit (int __status) __attribute__ ((__noreturn__));




int _putenv_r (struct _reent *, char *__string);
void * _reallocf_r (struct _reent *, void *, size_t);



int _setenv_r (struct _reent *, const char *__string, const char *__value, int __overwrite);
# 197 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/stdlib.h" 3
char * __itoa (int, char *, int);
char * __utoa (unsigned, char *, int);
# 236 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/stdlib.h" 3
long long atoll (const char *__nptr);

long long _atoll_r (struct _reent *, const char *__nptr);

long long llabs (long long);
lldiv_t lldiv (long long __numer, long long __denom);
long long strtoll (const char *restrict __n, char **restrict __end_PTR, int __base);

long long _strtoll_r (struct _reent *, const char *restrict __n, char **restrict __end_PTR, int __base);

unsigned long long strtoull (const char *restrict __n, char **restrict __end_PTR, int __base);

unsigned long long _strtoull_r (struct _reent *, const char *restrict __n, char **restrict __end_PTR, int __base);
# 257 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/stdlib.h" 3
int _unsetenv_r (struct _reent *, const char *__string);






char * _dtoa_r (struct _reent *, double, int, int, int *, int*, char**);

void * _malloc_r (struct _reent *, size_t) ;
void * _calloc_r (struct _reent *, size_t, size_t) ;
void _free_r (struct _reent *, void *) ;
void * _realloc_r (struct _reent *, void *, size_t) ;
void _mstats_r (struct _reent *, char *);

int _system_r (struct _reent *, const char *);

void __eprintf (const char *, const char *, unsigned int, const char *);
# 294 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/stdlib.h" 3
extern long double _strtold_r (struct _reent *, const char *restrict, char **restrict);

extern long double strtold (const char *restrict, char **restrict);
# 311 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/stdlib.h" 3

# 6 "main.c" 2
# 1 "../../libs/omsp_system.h" 1
# 36 "../../libs/omsp_system.h"
# 1 "/opt/ti/ccsv8/ccs_base/msp430/include_gcc/in430.h" 1
# 39 "/opt/ti/ccsv8/ccs_base/msp430/include_gcc/in430.h"
#define __IN430_H__ 
# 48 "/opt/ti/ccsv8/ccs_base/msp430/include_gcc/in430.h"

# 48 "/opt/ti/ccsv8/ccs_base/msp430/include_gcc/in430.h"
typedef unsigned int __istate_t;

#define _no_operation() __asm__ __volatile__ ("nop")

#define _get_interrupt_state() ({ unsigned int __x; __asm__ __volatile__( "mov SR, %0" : "=r" ((unsigned int) __x) :); __x; })
# 78 "/opt/ti/ccsv8/ccs_base/msp430/include_gcc/in430.h"
#define _set_interrupt_state(x) ({ __asm__ __volatile__ ("mov %0, SR" : : "ri"((unsigned int) x) );})






#define _enable_interrupts() __asm__ __volatile__ ("eint { nop")

#define _bis_SR_register(x) __asm__ __volatile__ ("bis.w %0, SR" : : "ri"((unsigned int) x) )






#define _disable_interrupts() __asm__ __volatile__ ("dint { nop")

#define _bic_SR_register(x) __asm__ __volatile__ ("bic.w %0, SR { nop" : : "ri"((unsigned int) x) )




#define _get_SR_register() ({ unsigned int __x; __asm__ __volatile__( "mov SR, %0" : "=r" ((unsigned int) __x) :); __x; })
# 111 "/opt/ti/ccsv8/ccs_base/msp430/include_gcc/in430.h"
#define _swap_bytes(x) ({ unsigned int __dst = x; __asm__ __volatile__( "swpb %0" : "+r" ((unsigned int) __dst) :); __dst; })
# 122 "/opt/ti/ccsv8/ccs_base/msp430/include_gcc/in430.h"
#define _bic_SR_register_on_exit(x) __bic_SR_register_on_exit(x)
#define _bis_SR_register_on_exit(x) __bis_SR_register_on_exit(x)


#define _bcd_add_short(x,y) ({ unsigned short __z = ((unsigned short) y); __asm__ __volatile__( "clrc \n\t" "dadd.w %1, %0" : "+r" ((unsigned short) __z) : "ri" ((unsigned short) x) ); __z; })
# 138 "/opt/ti/ccsv8/ccs_base/msp430/include_gcc/in430.h"
#define __bcd_add_short(x,y) _bcd_add_short(x,y)

#define _bcd_add_long(x,y) ({ unsigned long __z = ((unsigned long) y); __asm__ __volatile__( "clrc \n\t" "dadd.w %L1, %L0 \n\t" "dadd.w %H1, %H0" : "+r" ((unsigned long) __z) : "ri" ((unsigned long) x) ); __z; })
# 153 "/opt/ti/ccsv8/ccs_base/msp430/include_gcc/in430.h"
#define __bcd_add_long(x,y) _bcd_add_long(x,y)

#define _get_SP_register() ({ unsigned int __x; __asm__ __volatile__( "mov SP, %0" : "=r" ((unsigned int) __x) :); __x; })
# 165 "/opt/ti/ccsv8/ccs_base/msp430/include_gcc/in430.h"
#define __get_SP_register() _get_SP_register()

#define _set_SP_register(x) ({ __asm__ __volatile__ ("mov %0, SP" : : "ri"((unsigned int) x) );})






#define __set_SP_register(x) _set_SP_register(x)

#define _data16_write_addr(addr,src) ({ unsigned long __src = src; __asm__ __volatile__ ( "movx.a %1, 0(%0)" : : "r"((unsigned int) addr), "m"((unsigned long) __src) ); })
# 185 "/opt/ti/ccsv8/ccs_base/msp430/include_gcc/in430.h"
#define __data16_write_addr(addr,src) _data16_write_addr(addr,src)

#define _data16_read_addr(addr) ({ unsigned long __dst; __asm__ __volatile__ ( "movx.a @%1, %0" : "=m"((unsigned long) __dst) : "r"((unsigned int) addr) ); __dst; })
# 198 "/opt/ti/ccsv8/ccs_base/msp430/include_gcc/in430.h"
#define __data16_read_addr(addr) _data16_read_addr(addr)

#define _data20_write_char(addr,src) ({ unsigned int __tmp; unsigned long __addr = addr; __asm__ __volatile__ ( "movx.a %1, %0 \n\t" "mov.b  %2, 0(%0)" : "=&r"((unsigned int) __tmp) : "m"((unsigned long) __addr), "ri"((char) src) ); })
# 212 "/opt/ti/ccsv8/ccs_base/msp430/include_gcc/in430.h"
#define __data20_write_char(addr,src) _data20_write_char(addr,src)

#define _data20_read_char(addr) ({ char __dst; unsigned int __tmp; unsigned long __addr = addr; __asm__ __volatile__ ( "movx.a %2, %1 \n\t" "mov.b 0(%1), %0" : "=r"((char) __dst), "=&r"((unsigned int) __tmp) : "m"((unsigned long) __addr) ); __dst ; })
# 228 "/opt/ti/ccsv8/ccs_base/msp430/include_gcc/in430.h"
#define __data20_read_char(addr) _data20_read_char(addr)

#define _data20_write_short(addr,src) ({ unsigned int __tmp; unsigned long __addr = addr; __asm__ __volatile__ ( "movx.a %1, %0 \n\t" "mov.w  %2, 0(%0)" : "=&r"((unsigned int) __tmp) : "m"((unsigned long) __addr), "ri"((short) src) ); })
# 242 "/opt/ti/ccsv8/ccs_base/msp430/include_gcc/in430.h"
#define __data20_write_short(addr,src) _data20_write_short(addr,src)

#define _data20_read_short(addr) ({ short __dst; unsigned int __tmp; unsigned long __addr = addr; __asm__ __volatile__ ( "movx.a %2, %1 \n\t" "mov.w 0(%1), %0" : "=r"((short) __dst), "=&r"((unsigned int) __tmp) : "m"((unsigned long) __addr) ); __dst ; })
# 258 "/opt/ti/ccsv8/ccs_base/msp430/include_gcc/in430.h"
#define __data20_read_short(addr) _data20_read_short(addr)

#define _data20_write_long(addr,src) ({ unsigned int __tmp; unsigned long __addr = addr; __asm__ __volatile__ ( "movx.a %1, %0 \n\t" "mov.w  %L2, 0(%0) \n\t" "mov.w  %H2, 2(%0)" : "=&r"((unsigned int) __tmp) : "m"((unsigned long) __addr), "ri"((long) src) ); })
# 273 "/opt/ti/ccsv8/ccs_base/msp430/include_gcc/in430.h"
#define __data20_write_long(addr,src) _data20_write_long(addr,src)

#define _data20_read_long(addr) ({ long __dst; unsigned int __tmp; unsigned long __addr = addr; __asm__ __volatile__ ( "movx.a %2, %1 \n\t" "mov.w  0(%1), %L0 \n\t" "mov.w  2(%1), %H0" : "=r"((long) __dst), "=&r"((unsigned int) __tmp) : "m"((unsigned long) __addr) ); __dst ; })
# 290 "/opt/ti/ccsv8/ccs_base/msp430/include_gcc/in430.h"
#define __data20_read_long(addr) _data20_read_long(addr)

#define _low_power_mode_0() _bis_SR_register(0x18)
#define _low_power_mode_1() _bis_SR_register(0x58)
#define _low_power_mode_2() _bis_SR_register(0x98)
#define _low_power_mode_3() _bis_SR_register(0xD8)
#define _low_power_mode_4() _bis_SR_register(0xF8)
#define _low_power_mode_off_on_exit() _bic_SR_register_on_exit(0xF0)

#define __low_power_mode_0() _low_power_mode_0()
#define __low_power_mode_1() _low_power_mode_1()
#define __low_power_mode_2() _low_power_mode_2()
#define __low_power_mode_3() _low_power_mode_3()
#define __low_power_mode_4() _low_power_mode_4()
#define __low_power_mode_off_on_exit() _low_power_mode_off_on_exit()

#define _even_in_range(x,y) (x)
#define __even_in_range(x,y) _even_in_range(x,y)



#define __no_operation() _no_operation()

#define __get_interrupt_state() _get_interrupt_state()
#define __set_interrupt_state(x) _set_interrupt_state(x)
#define __enable_interrupt() _enable_interrupts()
#define __disable_interrupt() _disable_interrupts()

#define __bic_SR_register(x) _bic_SR_register(x)
#define __bis_SR_register(x) _bis_SR_register(x)
#define __get_SR_register() _get_SR_register()

#define __swap_bytes(x) _swap_bytes(x)

#define __nop() _no_operation()

#define __eint() _enable_interrupts()
#define __dint() _disable_interrupts()

#define _NOP() _no_operation()
#define _EINT() _enable_interrupts()
#define _DINT() _disable_interrupts()

#define _BIC_SR(x) _bic_SR_register(x)
#define _BIC_SR_IRQ(x) _bic_SR_register_on_exit(x)
#define _BIS_SR(x) _bis_SR_register(x)
#define _BIS_SR_IRQ(x) _bis_SR_register_on_exit(x)
#define _BIS_NMI_IE1(x) _bis_nmi_ie1(x)

#define _SWAP_BYTES(x) _swap_bytes(x)

#define __no_init __attribute__ ((section (".noinit")))
# 37 "../../libs/omsp_system.h" 2






#define C (0x0001)
#define Z (0x0002)
#define N (0x0004)
#define V (0x0100)
#define GIE (0x0008)
#define CPUOFF (0x0010)
#define OSCOFF (0x0020)
#define SCG0 (0x0040)
#define SCG1 (0x0080)


#define LPM0_bits (CPUOFF)
#define LPM1_bits (SCG0+CPUOFF)
#define LPM2_bits (SCG1+CPUOFF)
#define LPM3_bits (SCG1+SCG0+CPUOFF)
#define LPM4_bits (SCG1+SCG0+OSCOFF+CPUOFF)

#define LPM0 _BIS_SR(LPM0_bits)
#define LPM0_EXIT _BIC_SR_IRQ(LPM0_bits)
#define LPM1 _BIS_SR(LPM1_bits)
#define LPM1_EXIT _BIC_SR_IRQ(LPM1_bits)
#define LPM2 _BIS_SR(LPM2_bits)
#define LPM2_EXIT _BIC_SR_IRQ(LPM2_bits)
#define LPM3 _BIS_SR(LPM3_bits)
#define LPM3_EXIT _BIC_SR_IRQ(LPM3_bits)
#define LPM4 _BIS_SR(LPM4_bits)
#define LPM4_EXIT _BIC_SR_IRQ(LPM4_bits)
# 79 "../../libs/omsp_system.h"
#define IE1_set_wdtie() __asm__ __volatile__ ("bis.b #0x01, &0x0000")

#define IFG1 (*(volatile unsigned char *) 0x0002)

#define CPU_ID_LO (*(volatile unsigned int *) 0x0004)
#define CPU_ID_HI (*(volatile unsigned int *) 0x0006)
#define CPU_NR (*(volatile unsigned int *) 0x0008)





#define LED_CTRL (*(volatile unsigned char *) 0x0090)
#define KEY_SW_VAL (*(volatile unsigned char *) 0x0091)
#define KEY_SW_IRQ_EN (*(volatile unsigned char *) 0x0092)
#define KEY_SW_IRQ_EDGE (*(volatile unsigned char *) 0x0093)
#define KEY_SW_IRQ_VAL (*(volatile unsigned char *) 0x0094)





#define DCOCTL (*(volatile unsigned char *) 0x0056)
#define BCSCTL1 (*(volatile unsigned char *) 0x0057)
#define BCSCTL2 (*(volatile unsigned char *) 0x0058)







#define WDTCTL (*(volatile unsigned int *) 0x0120)


#define WDTIS0 (0x0001)
#define WDTIS1 (0x0002)
#define WDTSSEL (0x0004)
#define WDTCNTCL (0x0008)
#define WDTTMSEL (0x0010)
#define WDTNMI (0x0020)
#define WDTNMIES (0x0040)
#define WDTHOLD (0x0080)
#define WDTPW (0x5A00)





#define OP1_MPY (*(volatile unsigned int *) 0x0130)
#define OP1_MPYS (*(volatile unsigned int *) 0x0132)
#define OP1_MAC (*(volatile unsigned int *) 0x0134)
#define OP1_MACS (*(volatile unsigned int *) 0x0136)
#define OP2 (*(volatile unsigned int *) 0x0138)

#define RESLO (*(volatile unsigned int *) 0x013A)
#define RESHI (*(volatile unsigned int *) 0x013C)
#define SUMEXT (*(volatile unsigned int *) 0x013E)





#define interrupt(x) void __attribute__((interrupt (x)))
#define wakeup __attribute__((wakeup))
#define eint() __eint()
#define dint() __dint()



#define RESET_VECTOR ("reset")
#define NMI_VECTOR (15)
#define UNUSED_13_VECTOR (14)
#define UNUSED_12_VECTOR (13)
#define UNUSED_11_VECTOR (12)
#define WDT_VECTOR (11)
#define TIMERA0_VECTOR (10)
#define TIMERA1_VECTOR (9)
#define UNUSED_07_VECTOR (8)
#define UNUSED_06_VECTOR (7)
#define UNUSED_05_VECTOR (6)
#define UNUSED_04_VECTOR (5)
#define UNUSED_03_VECTOR (4)
#define PORT1_VECTOR (3)
#define UNUSED_01_VECTOR (2)
#define UNUSED_00_VECTOR (1)
# 7 "main.c" 2
# 1 "uart.h" 1
# 9 "uart.h"
#define UART_H_ 


int UART_WriteChar (char txdata);
void UART_WriteNumber (int n);
void UART_WriteString(char* string);




#define UART_CTL (*(volatile unsigned char *) 0x0080)
#define UART_STAT (*(volatile unsigned char *) 0x0081)
#define UART_BAUD (*(volatile unsigned int *) 0x0082)
#define UART_TXD (*(volatile unsigned char *) 0x0084)
#define UART_RXD (*(volatile unsigned char *) 0x0085)







#define UART_IEN_TX_EMPTY 0x80
#define UART_IEN_TX 0x40
#define UART_IEN_RX_OVFLW 0x20
#define UART_IEN_RX 0x10
#define UART_SMCLK_SEL 0x02
#define UART_EN 0x01


#define UART_TX_EMPTY_PND 0x80
#define UART_TX_PND 0x40
#define UART_RX_OVFLW_PND 0x20
#define UART_RX_PND 0x10
#define UART_TX_FULL 0x08
#define UART_TX_BUSY 0x04
#define UART_RX_BUSY 0x01






#define UART_TX_VECTOR (6 *2)
#define UART_RX_VECTOR (7 *2)
# 68 "uart.h"
#define BAUD 8
# 8 "main.c" 2
# 1 "qwark.h" 1
# 9 "qwark.h"
#define QWARK_H_ 

#define QWARK_CTL (*(volatile unsigned int *) 0x02A0)
#define QWARK_VECTOR (5)
#define QWARK_CHECKPOINT() QWARK_CTL |= 0x0020

#define QWARK_EN 0x01
# 9 "main.c" 2
# 1 "timerA.h" 1

#define TIMERA_H 







void ta_wait_no_lpm(unsigned int);
void ta_wait(unsigned int);



#define DCO_CLK_PERIOD 20
#define LFXT_CLK_PERIOD 10240


#define WT_20US ( 20000/LFXT_CLK_PERIOD)+1
#define WT_50US ( 50000/LFXT_CLK_PERIOD)+1
# 35 "timerA.h"
#define WT_100US ( 100000/LFXT_CLK_PERIOD)+1
#define WT_200US ( 200000/LFXT_CLK_PERIOD)+1
#define WT_500US ( 500000/LFXT_CLK_PERIOD)+1
#define WT_1MS ( 1000000/LFXT_CLK_PERIOD)+1
#define WT_2MS ( 2000000/LFXT_CLK_PERIOD)+1
#define WT_5MS ( 5000000/LFXT_CLK_PERIOD)+1
#define WT_10MS ( 10000000/LFXT_CLK_PERIOD)+1
#define WT_20MS ( 20000000/LFXT_CLK_PERIOD)+1
#define WT_50MS ( 50000000/LFXT_CLK_PERIOD)+1
#define WT_100MS (100000000/LFXT_CLK_PERIOD)+1
#define WT_200MS (200000000/LFXT_CLK_PERIOD)+1
#define WT_500MS (500000000/LFXT_CLK_PERIOD)+1






#define TACTL (*(volatile unsigned int *) 0x0160)
#define TAR (*(volatile unsigned int *) 0x0170)
#define TACCTL0 (*(volatile unsigned int *) 0x0162)
#define TACCR0 (*(volatile unsigned int *) 0x0172)
#define TACCTL1 (*(volatile unsigned int *) 0x0164)
#define TACCR1 (*(volatile unsigned int *) 0x0174)
#define TACCTL2 (*(volatile unsigned int *) 0x0166)
#define TACCR2 (*(volatile unsigned int *) 0x0176)
#define TAIV (*(volatile unsigned int *) 0x012E)






#define CCTL0 TACCTL0
#define CCTL1 TACCTL1
#define CCR0 TACCR0
#define CCR1 TACCR1


#define TASSEL1 (0x0200)
#define TASSEL0 (0x0100)
#define ID1 (0x0080)
#define ID0 (0x0040)
#define MC1 (0x0020)
#define MC0 (0x0010)
#define TACLR (0x0004)
#define TAIE (0x0002)
#define TAIFG (0x0001)

#define MC_0 (0x0000)
#define MC_1 (0x0010)
#define MC_2 (0x0020)
#define MC_3 (0x0030)
#define ID_0 (0x0000)
#define ID_1 (0x0040)
#define ID_2 (0x0080)
#define ID_3 (0x00C0)
#define TASSEL_0 (0x0000)
#define TASSEL_1 (0x0100)
#define TASSEL_2 (0x0200)
#define TASSEL_3 (0x0300)

#define CM1 (0x8000)
#define CM0 (0x4000)
#define CCIS1 (0x2000)
#define CCIS0 (0x1000)
#define SCS (0x0800)
#define SCCI (0x0400)
#define CAP (0x0100)
#define OUTMOD2 (0x0080)
#define OUTMOD1 (0x0040)
#define OUTMOD0 (0x0020)
#define CCIE (0x0010)
#define CCI (0x0008)
#define OUT (0x0004)
#define COV (0x0002)
#define CCIFG (0x0001)
# 10 "main.c" 2

#define SEED 4
#define ITER 100
#define CHAR_BIT 8

#define UART_DBG 

volatile unsigned n_0 =0;
volatile unsigned n_1 =0;
volatile unsigned n_2 =0;
volatile unsigned n_3 =0;
volatile unsigned n_4 =0;
volatile unsigned n_5 =0;
volatile unsigned n_6 =0;

char bits[256] =
{
      0, 1, 1, 2, 1, 2, 2, 3, 1, 2, 2, 3, 2, 3, 3, 4,
      1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5,
      1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5,
      2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,
      1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5,
      2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,
      2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,
      3, 4, 4, 5, 4, 5, 5, 6, 4, 5, 5, 6, 5, 6, 6, 7,
      1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5,
      2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,
      2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,
      3, 4, 4, 5, 4, 5, 5, 6, 4, 5, 5, 6, 5, 6, 6, 7,
      2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,
      3, 4, 4, 5, 4, 5, 5, 6, 4, 5, 5, 6, 5, 6, 6, 7,
      3, 4, 4, 5, 4, 5, 5, 6, 4, 5, 5, 6, 5, 6, 6, 7,
      4, 5, 5, 6, 5, 6, 6, 7, 5, 6, 6, 7, 6, 7, 7, 8
};


int btbl_bitcnt(uint32_t x)
{
      int cnt = bits[ ((char *)&x)[0] & 0xFF ];

      if (0L != (x >>= 8))
            cnt += btbl_bitcnt(x);
      return cnt;
}
int bit_count(uint32_t x)
{
        int n = 0;

        if (x) do
              n++;
        while (0 != (x = x&(x-1))) ;
        return(n);
}
int bitcount(uint32_t i)
{
      i = ((i & 0xAAAAAAAAL) >> 1) + (i & 0x55555555L);
      i = ((i & 0xCCCCCCCCL) >> 2) + (i & 0x33333333L);
      i = ((i & 0xF0F0F0F0L) >> 4) + (i & 0x0F0F0F0FL);
      i = ((i & 0xFF00FF00L) >> 8) + (i & 0x00FF00FFL);
      i = ((i & 0xFFFF0000L) >> 16) + (i & 0x0000FFFFL);
      return (int)i;
}
int ntbl_bitcount(uint32_t x)
{
      return
            bits[ (int) (x & 0x0000000FUL) ] +
            bits[ (int)((x & 0x000000F0UL) >> 4) ] +
            bits[ (int)((x & 0x00000F00UL) >> 8) ] +
            bits[ (int)((x & 0x0000F000UL) >> 12)] +
            bits[ (int)((x & 0x000F0000UL) >> 16)] +
            bits[ (int)((x & 0x00F00000UL) >> 20)] +
            bits[ (int)((x & 0x0F000000UL) >> 24)] +
            bits[ (int)((x & 0xF0000000UL) >> 28)];
}
int BW_btbl_bitcount(uint32_t x)
{
      union
      {
            unsigned char ch[4];
            long y;
      } U;

      U.y = x;

      return bits[ U.ch[0] ] + bits[ U.ch[1] ] +
             bits[ U.ch[3] ] + bits[ U.ch[2] ];
}
int AR_btbl_bitcount(uint32_t x)
{
      unsigned char * Ptr = (unsigned char *) &x ;
      int Accu ;

      Accu = bits[ *Ptr++ ];
      Accu += bits[ *Ptr++ ];
      Accu += bits[ *Ptr++ ];
      Accu += bits[ *Ptr ];
      return Accu;
}
int ntbl_bitcnt(uint32_t x)
{
      int cnt = bits[(int)(x & 0x0000000FL)];

      if (0L != (x >>= 4))
            cnt += ntbl_bitcnt(x);

      return cnt;
}

static int bit_shifter(uint32_t x)
{
  int i, n;
  for (i = n = 0; x && (i < (sizeof(uint32_t) * 8)); ++i, x >>= 1)
    n += (int)(x & 1L);
  return n;
}


void init()
{
     (*(volatile unsigned int *) 0x0120) = (0x5A00) | (0x0080);
    __asm__ __volatile__ ("nop");
     __asm__ __volatile__ ("eint { nop");
   (*(volatile unsigned int *) 0x0082) = 8;
     (*(volatile unsigned char *) 0x0080) = 0x01;

     (*(volatile unsigned int *) 0x02A0) = 0x01;
}



int main()
{
 init();
 (*(volatile unsigned char *) 0x0090) = 0xAA;




 uint32_t seed;
 unsigned iter;
 unsigned func;



 while(1){

 (*(volatile unsigned char *) 0x0090) ^= 0xFF;



 n_0=0;
 n_1=0;
 n_2=0;
 n_3=0;
 n_4=0;
 n_5=0;
 n_6=0;



 for (func = 0; func < 7; func++) {

  seed = (uint32_t)4;
  if(func == 0){
   for(iter = 0; iter < 100; ++iter, seed += 13){

    n_0 += bit_count(seed);
   }
  }
  else if(func == 1){
   for(iter = 0; iter < 100; ++iter, seed += 13){

    n_1 += bitcount(seed);
   }
  }
  else if(func == 2){
   for(iter = 0; iter < 100; ++iter, seed += 13){

    n_2 += ntbl_bitcnt(seed);
   }
  }
  else if(func == 3){
   for(iter = 0; iter < 100; ++iter, seed += 13){

    n_3 += ntbl_bitcount(seed);
   }
  }
  else if(func == 4){
   for(iter = 0; iter < 100; ++iter, seed += 13){

    n_4 += BW_btbl_bitcount(seed);
   }
  }
  else if(func == 5){
   for(iter = 0; iter < 100; ++iter, seed += 13){

    n_5 += AR_btbl_bitcount(seed);
   }
  }
  else if(func == 6){
   for(iter = 0; iter < 100; ++iter, seed += 13){

    n_6 += bit_shifter(seed);
   }
  }
 }



  (*(volatile unsigned char *) 0x0090) = 0xBE;
 UART_WriteString("Benchmark Complete! \r\n");
  (*(volatile unsigned char *) 0x0090) = 0x00;
 UART_WriteNumber(n_0);
  (*(volatile unsigned char *) 0x0090) = 0xE0;
 UART_WriteString("\r\n");
  (*(volatile unsigned char *) 0x0090) = 0x01;
 UART_WriteNumber(n_1);

  (*(volatile unsigned char *) 0x0090) = 0xE1;
 UART_WriteString("\r\n");
  (*(volatile unsigned char *) 0x0090) = 0x02;
 UART_WriteNumber(n_2);

  (*(volatile unsigned char *) 0x0090) = 0xE2;
 UART_WriteString("\r\n");
  (*(volatile unsigned char *) 0x0090) = 0x03;
 UART_WriteNumber(n_3);
  (*(volatile unsigned char *) 0x0090) = 0xE3;
 UART_WriteString("\r\n");
  (*(volatile unsigned char *) 0x0090) = 0x04;
 UART_WriteNumber(n_4);
  (*(volatile unsigned char *) 0x0090) = 0xE4;
 UART_WriteString("\r\n");
  (*(volatile unsigned char *) 0x0090) = 0x05;
 UART_WriteNumber(n_5);
  (*(volatile unsigned char *) 0x0090) = 0xE5;
 UART_WriteString("\r\n");
  (*(volatile unsigned char *) 0x0090) = 0x06;
 UART_WriteNumber(n_6);
  (*(volatile unsigned char *) 0x0090) = 0xE6;
 UART_WriteString("\r\n");


 }

}
