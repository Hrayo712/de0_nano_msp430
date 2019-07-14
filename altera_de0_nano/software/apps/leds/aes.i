# 1 "aes.c"
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
# 1 "aes.c"
# 28 "aes.c"
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
# 29 "aes.c" 2
# 1 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/string.h" 1 3







#define _STRING_H_ 

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
# 11 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/string.h" 2 3
# 1 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/reent.h" 1 3
# 11 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/reent.h" 3
#define _SYS_REENT_H_ 

# 1 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/_ansi.h" 1 3
# 14 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/reent.h" 2 3
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
# 12 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/string.h" 2 3
# 1 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/cdefs.h" 1 3
# 41 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/cdefs.h" 3
#define _SYS_CDEFS_H_ 



# 1 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/lib/gcc/msp430-elf/7.3.1/include/stddef.h" 1 3 4
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
# 13 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/string.h" 2 3


#define __need_size_t 
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
# 18 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/string.h" 2 3



void * memchr (const void *, int, size_t);
int memcmp (const void *, const void *, size_t);
void * memcpy (void * restrict, const void * restrict, size_t);
void * memmove (void *, const void *, size_t);
void * memset (void *, int, size_t);
char *strcat (char *restrict, const char *restrict);
char *strchr (const char *, int);
int strcmp (const char *, const char *);
int strcoll (const char *, const char *);
char *strcpy (char *restrict, const char *restrict);
size_t strcspn (const char *, const char *);
char *strerror (int);
size_t strlen (const char *);
char *strncat (char *restrict, const char *restrict, size_t);
int strncmp (const char *, const char *, size_t);
char *strncpy (char *restrict, const char *restrict, size_t);
char *strpbrk (const char *, const char *);
char *strrchr (const char *, int);
size_t strspn (const char *, const char *);
char *strstr (const char *, const char *);

char *strtok (char *restrict, const char *restrict);

size_t strxfrm (char *restrict, const char *restrict, size_t);
# 77 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/string.h" 3
char *stpcpy (char *restrict, const char *restrict);
char *stpncpy (char *restrict, const char *restrict, size_t);
# 89 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/string.h" 3
char *_strdup_r (struct _reent *, const char *);



char *_strndup_r (struct _reent *, const char *, size_t);
# 120 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/string.h" 3
char * _strerror_r (struct _reent *, int, int, int *);
# 142 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/string.h" 3
char *strsignal (int __signo);
# 179 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/string.h" 3
# 1 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/string.h" 1 3
# 180 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/string.h" 2 3


# 30 "aes.c" 2
# 1 "aes.h" 1

#define _AES_H_ 
# 14 "aes.h"
#define CBC 1



#define ECB 1







# 25 "aes.h"
void AES128_ECB_encrypt(uint8_t* input, const uint8_t* key, uint8_t *output);
void AES128_ECB_decrypt(uint8_t* input, const uint8_t* key, uint8_t *output);






void AES128_CBC_encrypt_buffer(uint8_t* output, uint8_t* input, uint32_t length, const uint8_t* key, const uint8_t* iv);
void AES128_CBC_decrypt_buffer(uint8_t* output, uint8_t* input, uint32_t length, const uint8_t* key, const uint8_t* iv);
# 31 "aes.c" 2






#define Nb 4

#define Nk 4

#define KEYLEN 16

#define Nr 10





#define MULTIPLY_AS_A_FUNCTION 0







typedef uint8_t state_t[4][4];
static state_t* state;


static uint8_t RoundKey[176];


static const uint8_t* Key;



  static uint8_t* Iv;





static const uint8_t sbox[256] = {

  0x63, 0x7c, 0x77, 0x7b, 0xf2, 0x6b, 0x6f, 0xc5, 0x30, 0x01, 0x67, 0x2b, 0xfe, 0xd7, 0xab, 0x76,
  0xca, 0x82, 0xc9, 0x7d, 0xfa, 0x59, 0x47, 0xf0, 0xad, 0xd4, 0xa2, 0xaf, 0x9c, 0xa4, 0x72, 0xc0,
  0xb7, 0xfd, 0x93, 0x26, 0x36, 0x3f, 0xf7, 0xcc, 0x34, 0xa5, 0xe5, 0xf1, 0x71, 0xd8, 0x31, 0x15,
  0x04, 0xc7, 0x23, 0xc3, 0x18, 0x96, 0x05, 0x9a, 0x07, 0x12, 0x80, 0xe2, 0xeb, 0x27, 0xb2, 0x75,
  0x09, 0x83, 0x2c, 0x1a, 0x1b, 0x6e, 0x5a, 0xa0, 0x52, 0x3b, 0xd6, 0xb3, 0x29, 0xe3, 0x2f, 0x84,
  0x53, 0xd1, 0x00, 0xed, 0x20, 0xfc, 0xb1, 0x5b, 0x6a, 0xcb, 0xbe, 0x39, 0x4a, 0x4c, 0x58, 0xcf,
  0xd0, 0xef, 0xaa, 0xfb, 0x43, 0x4d, 0x33, 0x85, 0x45, 0xf9, 0x02, 0x7f, 0x50, 0x3c, 0x9f, 0xa8,
  0x51, 0xa3, 0x40, 0x8f, 0x92, 0x9d, 0x38, 0xf5, 0xbc, 0xb6, 0xda, 0x21, 0x10, 0xff, 0xf3, 0xd2,
  0xcd, 0x0c, 0x13, 0xec, 0x5f, 0x97, 0x44, 0x17, 0xc4, 0xa7, 0x7e, 0x3d, 0x64, 0x5d, 0x19, 0x73,
  0x60, 0x81, 0x4f, 0xdc, 0x22, 0x2a, 0x90, 0x88, 0x46, 0xee, 0xb8, 0x14, 0xde, 0x5e, 0x0b, 0xdb,
  0xe0, 0x32, 0x3a, 0x0a, 0x49, 0x06, 0x24, 0x5c, 0xc2, 0xd3, 0xac, 0x62, 0x91, 0x95, 0xe4, 0x79,
  0xe7, 0xc8, 0x37, 0x6d, 0x8d, 0xd5, 0x4e, 0xa9, 0x6c, 0x56, 0xf4, 0xea, 0x65, 0x7a, 0xae, 0x08,
  0xba, 0x78, 0x25, 0x2e, 0x1c, 0xa6, 0xb4, 0xc6, 0xe8, 0xdd, 0x74, 0x1f, 0x4b, 0xbd, 0x8b, 0x8a,
  0x70, 0x3e, 0xb5, 0x66, 0x48, 0x03, 0xf6, 0x0e, 0x61, 0x35, 0x57, 0xb9, 0x86, 0xc1, 0x1d, 0x9e,
  0xe1, 0xf8, 0x98, 0x11, 0x69, 0xd9, 0x8e, 0x94, 0x9b, 0x1e, 0x87, 0xe9, 0xce, 0x55, 0x28, 0xdf,
  0x8c, 0xa1, 0x89, 0x0d, 0xbf, 0xe6, 0x42, 0x68, 0x41, 0x99, 0x2d, 0x0f, 0xb0, 0x54, 0xbb, 0x16 };

static const uint8_t rsbox[256] =
{ 0x52, 0x09, 0x6a, 0xd5, 0x30, 0x36, 0xa5, 0x38, 0xbf, 0x40, 0xa3, 0x9e, 0x81, 0xf3, 0xd7, 0xfb,
  0x7c, 0xe3, 0x39, 0x82, 0x9b, 0x2f, 0xff, 0x87, 0x34, 0x8e, 0x43, 0x44, 0xc4, 0xde, 0xe9, 0xcb,
  0x54, 0x7b, 0x94, 0x32, 0xa6, 0xc2, 0x23, 0x3d, 0xee, 0x4c, 0x95, 0x0b, 0x42, 0xfa, 0xc3, 0x4e,
  0x08, 0x2e, 0xa1, 0x66, 0x28, 0xd9, 0x24, 0xb2, 0x76, 0x5b, 0xa2, 0x49, 0x6d, 0x8b, 0xd1, 0x25,
  0x72, 0xf8, 0xf6, 0x64, 0x86, 0x68, 0x98, 0x16, 0xd4, 0xa4, 0x5c, 0xcc, 0x5d, 0x65, 0xb6, 0x92,
  0x6c, 0x70, 0x48, 0x50, 0xfd, 0xed, 0xb9, 0xda, 0x5e, 0x15, 0x46, 0x57, 0xa7, 0x8d, 0x9d, 0x84,
  0x90, 0xd8, 0xab, 0x00, 0x8c, 0xbc, 0xd3, 0x0a, 0xf7, 0xe4, 0x58, 0x05, 0xb8, 0xb3, 0x45, 0x06,
  0xd0, 0x2c, 0x1e, 0x8f, 0xca, 0x3f, 0x0f, 0x02, 0xc1, 0xaf, 0xbd, 0x03, 0x01, 0x13, 0x8a, 0x6b,
  0x3a, 0x91, 0x11, 0x41, 0x4f, 0x67, 0xdc, 0xea, 0x97, 0xf2, 0xcf, 0xce, 0xf0, 0xb4, 0xe6, 0x73,
  0x96, 0xac, 0x74, 0x22, 0xe7, 0xad, 0x35, 0x85, 0xe2, 0xf9, 0x37, 0xe8, 0x1c, 0x75, 0xdf, 0x6e,
  0x47, 0xf1, 0x1a, 0x71, 0x1d, 0x29, 0xc5, 0x89, 0x6f, 0xb7, 0x62, 0x0e, 0xaa, 0x18, 0xbe, 0x1b,
  0xfc, 0x56, 0x3e, 0x4b, 0xc6, 0xd2, 0x79, 0x20, 0x9a, 0xdb, 0xc0, 0xfe, 0x78, 0xcd, 0x5a, 0xf4,
  0x1f, 0xdd, 0xa8, 0x33, 0x88, 0x07, 0xc7, 0x31, 0xb1, 0x12, 0x10, 0x59, 0x27, 0x80, 0xec, 0x5f,
  0x60, 0x51, 0x7f, 0xa9, 0x19, 0xb5, 0x4a, 0x0d, 0x2d, 0xe5, 0x7a, 0x9f, 0x93, 0xc9, 0x9c, 0xef,
  0xa0, 0xe0, 0x3b, 0x4d, 0xae, 0x2a, 0xf5, 0xb0, 0xc8, 0xeb, 0xbb, 0x3c, 0x83, 0x53, 0x99, 0x61,
  0x17, 0x2b, 0x04, 0x7e, 0xba, 0x77, 0xd6, 0x26, 0xe1, 0x69, 0x14, 0x63, 0x55, 0x21, 0x0c, 0x7d };





static const uint8_t Rcon[255] = {
  0x8d, 0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 0x1b, 0x36, 0x6c, 0xd8, 0xab, 0x4d, 0x9a,
  0x2f, 0x5e, 0xbc, 0x63, 0xc6, 0x97, 0x35, 0x6a, 0xd4, 0xb3, 0x7d, 0xfa, 0xef, 0xc5, 0x91, 0x39,
  0x72, 0xe4, 0xd3, 0xbd, 0x61, 0xc2, 0x9f, 0x25, 0x4a, 0x94, 0x33, 0x66, 0xcc, 0x83, 0x1d, 0x3a,
  0x74, 0xe8, 0xcb, 0x8d, 0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 0x1b, 0x36, 0x6c, 0xd8,
  0xab, 0x4d, 0x9a, 0x2f, 0x5e, 0xbc, 0x63, 0xc6, 0x97, 0x35, 0x6a, 0xd4, 0xb3, 0x7d, 0xfa, 0xef,
  0xc5, 0x91, 0x39, 0x72, 0xe4, 0xd3, 0xbd, 0x61, 0xc2, 0x9f, 0x25, 0x4a, 0x94, 0x33, 0x66, 0xcc,
  0x83, 0x1d, 0x3a, 0x74, 0xe8, 0xcb, 0x8d, 0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 0x1b,
  0x36, 0x6c, 0xd8, 0xab, 0x4d, 0x9a, 0x2f, 0x5e, 0xbc, 0x63, 0xc6, 0x97, 0x35, 0x6a, 0xd4, 0xb3,
  0x7d, 0xfa, 0xef, 0xc5, 0x91, 0x39, 0x72, 0xe4, 0xd3, 0xbd, 0x61, 0xc2, 0x9f, 0x25, 0x4a, 0x94,
  0x33, 0x66, 0xcc, 0x83, 0x1d, 0x3a, 0x74, 0xe8, 0xcb, 0x8d, 0x01, 0x02, 0x04, 0x08, 0x10, 0x20,
  0x40, 0x80, 0x1b, 0x36, 0x6c, 0xd8, 0xab, 0x4d, 0x9a, 0x2f, 0x5e, 0xbc, 0x63, 0xc6, 0x97, 0x35,
  0x6a, 0xd4, 0xb3, 0x7d, 0xfa, 0xef, 0xc5, 0x91, 0x39, 0x72, 0xe4, 0xd3, 0xbd, 0x61, 0xc2, 0x9f,
  0x25, 0x4a, 0x94, 0x33, 0x66, 0xcc, 0x83, 0x1d, 0x3a, 0x74, 0xe8, 0xcb, 0x8d, 0x01, 0x02, 0x04,
  0x08, 0x10, 0x20, 0x40, 0x80, 0x1b, 0x36, 0x6c, 0xd8, 0xab, 0x4d, 0x9a, 0x2f, 0x5e, 0xbc, 0x63,
  0xc6, 0x97, 0x35, 0x6a, 0xd4, 0xb3, 0x7d, 0xfa, 0xef, 0xc5, 0x91, 0x39, 0x72, 0xe4, 0xd3, 0xbd,
  0x61, 0xc2, 0x9f, 0x25, 0x4a, 0x94, 0x33, 0x66, 0xcc, 0x83, 0x1d, 0x3a, 0x74, 0xe8, 0xcb };





static uint8_t getSBoxValue(uint8_t num)
{
  return sbox[num];
}

static uint8_t getSBoxInvert(uint8_t num)
{
  return rsbox[num];
}


static void KeyExpansion(void)
{
  uint32_t i, j, k;
  uint8_t tempa[4];


  for(i = 0; i < 4; ++i)
  {
    RoundKey[(i * 4) + 0] = Key[(i * 4) + 0];
    RoundKey[(i * 4) + 1] = Key[(i * 4) + 1];
    RoundKey[(i * 4) + 2] = Key[(i * 4) + 2];
    RoundKey[(i * 4) + 3] = Key[(i * 4) + 3];
  }


  for(; (i < (4 * (10 + 1))); ++i)
  {
    for(j = 0; j < 4; ++j)
    {
      tempa[j]=RoundKey[(i-1) * 4 + j];
    }
    if (i % 4 == 0)
    {




      {
        k = tempa[0];
        tempa[0] = tempa[1];
        tempa[1] = tempa[2];
        tempa[2] = tempa[3];
        tempa[3] = k;
      }





      {
        tempa[0] = getSBoxValue(tempa[0]);
        tempa[1] = getSBoxValue(tempa[1]);
        tempa[2] = getSBoxValue(tempa[2]);
        tempa[3] = getSBoxValue(tempa[3]);
      }

      tempa[0] = tempa[0] ^ Rcon[i/4];
    }
    else if (4 > 6 && i % 4 == 4)
    {

      {
        tempa[0] = getSBoxValue(tempa[0]);
        tempa[1] = getSBoxValue(tempa[1]);
        tempa[2] = getSBoxValue(tempa[2]);
        tempa[3] = getSBoxValue(tempa[3]);
      }
    }
    RoundKey[i * 4 + 0] = RoundKey[(i - 4) * 4 + 0] ^ tempa[0];
    RoundKey[i * 4 + 1] = RoundKey[(i - 4) * 4 + 1] ^ tempa[1];
    RoundKey[i * 4 + 2] = RoundKey[(i - 4) * 4 + 2] ^ tempa[2];
    RoundKey[i * 4 + 3] = RoundKey[(i - 4) * 4 + 3] ^ tempa[3];
  }
}



static void AddRoundKey(uint8_t round)
{
  uint8_t i,j;
  for(i=0;i<4;++i)
  {
    for(j = 0; j < 4; ++j)
    {
      (*state)[i][j] ^= RoundKey[round * 4 * 4 + i * 4 + j];
    }
  }
}



static void SubBytes(void)
{
  uint8_t i, j;
  for(i = 0; i < 4; ++i)
  {
    for(j = 0; j < 4; ++j)
    {
      (*state)[j][i] = getSBoxValue((*state)[j][i]);
    }
  }
}




static void ShiftRows(void)
{
  uint8_t temp;


  temp = (*state)[0][1];
  (*state)[0][1] = (*state)[1][1];
  (*state)[1][1] = (*state)[2][1];
  (*state)[2][1] = (*state)[3][1];
  (*state)[3][1] = temp;


  temp = (*state)[0][2];
  (*state)[0][2] = (*state)[2][2];
  (*state)[2][2] = temp;

  temp = (*state)[1][2];
  (*state)[1][2] = (*state)[3][2];
  (*state)[3][2] = temp;


  temp = (*state)[0][3];
  (*state)[0][3] = (*state)[3][3];
  (*state)[3][3] = (*state)[2][3];
  (*state)[2][3] = (*state)[1][3];
  (*state)[1][3] = temp;
}

static uint8_t xtime(uint8_t x)
{
  return ((x<<1) ^ (((x>>7) & 1) * 0x1b));
}


static void MixColumns(void)
{
  uint8_t i;
  uint8_t Tmp,Tm,t;
  for(i = 0; i < 4; ++i)
  {
    t = (*state)[i][0];
    Tmp = (*state)[i][0] ^ (*state)[i][1] ^ (*state)[i][2] ^ (*state)[i][3] ;
    Tm = (*state)[i][0] ^ (*state)[i][1] ; Tm = xtime(Tm); (*state)[i][0] ^= Tm ^ Tmp ;
    Tm = (*state)[i][1] ^ (*state)[i][2] ; Tm = xtime(Tm); (*state)[i][1] ^= Tm ^ Tmp ;
    Tm = (*state)[i][2] ^ (*state)[i][3] ; Tm = xtime(Tm); (*state)[i][2] ^= Tm ^ Tmp ;
    Tm = (*state)[i][3] ^ t ; Tm = xtime(Tm); (*state)[i][3] ^= Tm ^ Tmp ;
  }
}
# 304 "aes.c"
#define Multiply(x,y) ( ((y & 1) * x) ^ ((y>>1 & 1) * xtime(x)) ^ ((y>>2 & 1) * xtime(xtime(x))) ^ ((y>>3 & 1) * xtime(xtime(xtime(x)))) ^ ((y>>4 & 1) * xtime(xtime(xtime(xtime(x))))))
# 316 "aes.c"
static void InvMixColumns(void)
{
  int i;
  uint8_t a,b,c,d;
  for(i=0;i<4;++i)
  {
    a = (*state)[i][0];
    b = (*state)[i][1];
    c = (*state)[i][2];
    d = (*state)[i][3];

    (*state)[i][0] = ( ((0x0e & 1) * a) ^ ((0x0e>>1 & 1) * xtime(a)) ^ ((0x0e>>2 & 1) * xtime(xtime(a))) ^ ((0x0e>>3 & 1) * xtime(xtime(xtime(a)))) ^ ((0x0e>>4 & 1) * xtime(xtime(xtime(xtime(a)))))) ^ ( ((0x0b & 1) * b) ^ ((0x0b>>1 & 1) * xtime(b)) ^ ((0x0b>>2 & 1) * xtime(xtime(b))) ^ ((0x0b>>3 & 1) * xtime(xtime(xtime(b)))) ^ ((0x0b>>4 & 1) * xtime(xtime(xtime(xtime(b)))))) ^ ( ((0x0d & 1) * c) ^ ((0x0d>>1 & 1) * xtime(c)) ^ ((0x0d>>2 & 1) * xtime(xtime(c))) ^ ((0x0d>>3 & 1) * xtime(xtime(xtime(c)))) ^ ((0x0d>>4 & 1) * xtime(xtime(xtime(xtime(c)))))) ^ ( ((0x09 & 1) * d) ^ ((0x09>>1 & 1) * xtime(d)) ^ ((0x09>>2 & 1) * xtime(xtime(d))) ^ ((0x09>>3 & 1) * xtime(xtime(xtime(d)))) ^ ((0x09>>4 & 1) * xtime(xtime(xtime(xtime(d))))));
    (*state)[i][1] = ( ((0x09 & 1) * a) ^ ((0x09>>1 & 1) * xtime(a)) ^ ((0x09>>2 & 1) * xtime(xtime(a))) ^ ((0x09>>3 & 1) * xtime(xtime(xtime(a)))) ^ ((0x09>>4 & 1) * xtime(xtime(xtime(xtime(a)))))) ^ ( ((0x0e & 1) * b) ^ ((0x0e>>1 & 1) * xtime(b)) ^ ((0x0e>>2 & 1) * xtime(xtime(b))) ^ ((0x0e>>3 & 1) * xtime(xtime(xtime(b)))) ^ ((0x0e>>4 & 1) * xtime(xtime(xtime(xtime(b)))))) ^ ( ((0x0b & 1) * c) ^ ((0x0b>>1 & 1) * xtime(c)) ^ ((0x0b>>2 & 1) * xtime(xtime(c))) ^ ((0x0b>>3 & 1) * xtime(xtime(xtime(c)))) ^ ((0x0b>>4 & 1) * xtime(xtime(xtime(xtime(c)))))) ^ ( ((0x0d & 1) * d) ^ ((0x0d>>1 & 1) * xtime(d)) ^ ((0x0d>>2 & 1) * xtime(xtime(d))) ^ ((0x0d>>3 & 1) * xtime(xtime(xtime(d)))) ^ ((0x0d>>4 & 1) * xtime(xtime(xtime(xtime(d))))));
    (*state)[i][2] = ( ((0x0d & 1) * a) ^ ((0x0d>>1 & 1) * xtime(a)) ^ ((0x0d>>2 & 1) * xtime(xtime(a))) ^ ((0x0d>>3 & 1) * xtime(xtime(xtime(a)))) ^ ((0x0d>>4 & 1) * xtime(xtime(xtime(xtime(a)))))) ^ ( ((0x09 & 1) * b) ^ ((0x09>>1 & 1) * xtime(b)) ^ ((0x09>>2 & 1) * xtime(xtime(b))) ^ ((0x09>>3 & 1) * xtime(xtime(xtime(b)))) ^ ((0x09>>4 & 1) * xtime(xtime(xtime(xtime(b)))))) ^ ( ((0x0e & 1) * c) ^ ((0x0e>>1 & 1) * xtime(c)) ^ ((0x0e>>2 & 1) * xtime(xtime(c))) ^ ((0x0e>>3 & 1) * xtime(xtime(xtime(c)))) ^ ((0x0e>>4 & 1) * xtime(xtime(xtime(xtime(c)))))) ^ ( ((0x0b & 1) * d) ^ ((0x0b>>1 & 1) * xtime(d)) ^ ((0x0b>>2 & 1) * xtime(xtime(d))) ^ ((0x0b>>3 & 1) * xtime(xtime(xtime(d)))) ^ ((0x0b>>4 & 1) * xtime(xtime(xtime(xtime(d))))));
    (*state)[i][3] = ( ((0x0b & 1) * a) ^ ((0x0b>>1 & 1) * xtime(a)) ^ ((0x0b>>2 & 1) * xtime(xtime(a))) ^ ((0x0b>>3 & 1) * xtime(xtime(xtime(a)))) ^ ((0x0b>>4 & 1) * xtime(xtime(xtime(xtime(a)))))) ^ ( ((0x0d & 1) * b) ^ ((0x0d>>1 & 1) * xtime(b)) ^ ((0x0d>>2 & 1) * xtime(xtime(b))) ^ ((0x0d>>3 & 1) * xtime(xtime(xtime(b)))) ^ ((0x0d>>4 & 1) * xtime(xtime(xtime(xtime(b)))))) ^ ( ((0x09 & 1) * c) ^ ((0x09>>1 & 1) * xtime(c)) ^ ((0x09>>2 & 1) * xtime(xtime(c))) ^ ((0x09>>3 & 1) * xtime(xtime(xtime(c)))) ^ ((0x09>>4 & 1) * xtime(xtime(xtime(xtime(c)))))) ^ ( ((0x0e & 1) * d) ^ ((0x0e>>1 & 1) * xtime(d)) ^ ((0x0e>>2 & 1) * xtime(xtime(d))) ^ ((0x0e>>3 & 1) * xtime(xtime(xtime(d)))) ^ ((0x0e>>4 & 1) * xtime(xtime(xtime(xtime(d))))));
  }
}




static void InvSubBytes(void)
{
  uint8_t i,j;
  for(i=0;i<4;++i)
  {
    for(j=0;j<4;++j)
    {
      (*state)[j][i] = getSBoxInvert((*state)[j][i]);
    }
  }
}

static void InvShiftRows(void)
{
  uint8_t temp;


  temp=(*state)[3][1];
  (*state)[3][1]=(*state)[2][1];
  (*state)[2][1]=(*state)[1][1];
  (*state)[1][1]=(*state)[0][1];
  (*state)[0][1]=temp;


  temp=(*state)[0][2];
  (*state)[0][2]=(*state)[2][2];
  (*state)[2][2]=temp;

  temp=(*state)[1][2];
  (*state)[1][2]=(*state)[3][2];
  (*state)[3][2]=temp;


  temp=(*state)[0][3];
  (*state)[0][3]=(*state)[1][3];
  (*state)[1][3]=(*state)[2][3];
  (*state)[2][3]=(*state)[3][3];
  (*state)[3][3]=temp;
}



static void Cipher(void)
{
  uint8_t round = 0;


  AddRoundKey(0);




  for(round = 1; round < 10; ++round)
  {
    SubBytes();
    ShiftRows();
    MixColumns();
    AddRoundKey(round);
  }



  SubBytes();
  ShiftRows();
  AddRoundKey(10);
}

static void InvCipher(void)
{
  uint8_t round=0;


  AddRoundKey(10);




  for(round=10 -1;round>0;round--)
  {
    InvShiftRows();
    InvSubBytes();
    AddRoundKey(round);
    InvMixColumns();
  }



  InvShiftRows();
  InvSubBytes();
  AddRoundKey(0);
}

static void BlockCopy(uint8_t* output, uint8_t* input)
{
  uint8_t i;
  for (i=0;i<16;++i)
  {
    output[i] = input[i];
  }
}
# 446 "aes.c"
void AES128_ECB_encrypt(uint8_t* input, const uint8_t* key, uint8_t* output)
{

  BlockCopy(output, input);
  state = (state_t*)output;

  Key = key;
  KeyExpansion();


  Cipher();
}

void AES128_ECB_decrypt(uint8_t* input, const uint8_t* key, uint8_t *output)
{

  BlockCopy(output, input);
  state = (state_t*)output;


  Key = key;
  KeyExpansion();

  InvCipher();
}
# 482 "aes.c"
static void XorWithIv(uint8_t* buf)
{
  uint8_t i;
  for(i = 0; i < 16; ++i)
  {
    buf[i] ^= Iv[i];
  }
}

void AES128_CBC_encrypt_buffer(uint8_t* output, uint8_t* input, uint32_t length, const uint8_t* key, const uint8_t* iv)
{
  intptr_t i;
  uint8_t remainders = length % 16;

  BlockCopy(output, input);
  state = (state_t*)output;


  if(0 != key)
  {
    Key = key;
    KeyExpansion();
  }

  if(iv != 0)
  {
    Iv = (uint8_t*)iv;
  }

  for(i = 0; i < length; i += 16)
  {
    XorWithIv(input);
    BlockCopy(output, input);
    state = (state_t*)output;
    Cipher();
    Iv = output;
    input += 16;
    output += 16;
  }

  if(remainders)
  {
    BlockCopy(output, input);
    memset(output + remainders, 0, 16 - remainders);
    state = (state_t*)output;
    Cipher();
  }
}

void AES128_CBC_decrypt_buffer(uint8_t* output, uint8_t* input, uint32_t length, const uint8_t* key, const uint8_t* iv)
{
  intptr_t i;
  uint8_t remainders = length % 16;

  BlockCopy(output, input);
  state = (state_t*)output;


  if(0 != key)
  {
    Key = key;
    KeyExpansion();
  }


  if(iv != 0)
  {
    Iv = (uint8_t*)iv;
  }

  for(i = 0; i < length; i += 16)
  {
    BlockCopy(output, input);
    state = (state_t*)output;
    InvCipher();
    XorWithIv(output);
    Iv = input;
    input += 16;
    output += 16;
  }

  if(remainders)
  {
    BlockCopy(output, input);
    memset(output+remainders, 0, 16 - remainders);
    state = (state_t*)output;
    InvCipher();
  }
}
