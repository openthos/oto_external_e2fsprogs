LOCAL_PATH := $(call my-dir)

libext2fs_src_files := \
	ext2_err.c \
	alloc.c \
	alloc_sb.c \
	alloc_stats.c \
	alloc_tables.c \
	atexit.c \
	badblocks.c \
	bb_inode.c \
	bitmaps.c \
	bitops.c \
	blkmap64_ba.c \
	blkmap64_rb.c \
	blknum.c \
	block.c \
	bmap.c \
	check_desc.c \
	crc16.c \
	crc32c.c \
	csum.c \
	closefs.c \
	dblist.c \
	dblist_dir.c \
	digest_encode.c \
	dirblock.c \
	dirhash.c \
	dir_iterate.c \
	dupfs.c \
	expanddir.c \
	ext_attr.c \
	extent.c \
	fallocate.c \
	fileio.c \
	finddev.c \
	flushb.c \
	freefs.c \
	gen_bitmap.c \
	gen_bitmap64.c \
	get_num_dirs.c \
	get_pathname.c \
	getsize.c \
	getsectsize.c \
	hashmap.c \
	i_block.c \
	icount.c \
	imager.c \
	ind_block.c \
	initialize.c \
	inline.c \
	inline_data.c \
	inode.c \
	io_manager.c \
	ismounted.c \
	link.c \
	llseek.c \
	lookup.c \
	mmp.c \
	mkdir.c \
	mkjournal.c \
	namei.c \
	native.c \
	newdir.c \
	nls_ascii.c \
	nls_utf8.c \
	nls_utf8-norm.c \
	openfs.c \
	progress.c \
	punch.c \
	qcow2.c \
	rbtree.c \
	read_bb.c \
	read_bb_file.c \
	res_gdt.c \
	rw_bitmaps.c \
	sha256.c \
	sha512.c \
	swapfs.c \
	symlink.c \
	undo_io.c \
	unix_io.c \
	sparse_io.c \
	unlink.c \
	valid_blk.c \
	version.c

# get rid of this?!
libext2fs_src_files += test_io.c

libext2fs_shared_libraries := \
	libext2_com_err \
	libext2_uuid

libext2fs_system_shared_libraries := libc

libext2fs_static_libraries := \
	libext2_com_err \
	libext2_uuid_static

libext2fs_system_static_libraries := libc

libext2fs_c_includes := $(LOCAL_PATH)/..

libext2fs_cflags := -O2 -g -W -Wall -Wno-unused-parameter
libext2fs_cflags += -std=c11

include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(libext2fs_src_files)
LOCAL_SYSTEM_SHARED_LIBRARIES := $(libext2fs_system_shared_libraries)
LOCAL_SHARED_LIBRARIES := $(libext2fs_shared_libraries) libsparse libz
LOCAL_C_INCLUDES := $(libext2fs_c_includes)
LOCAL_EXPORT_C_INCLUDE_DIRS := $(libext2fs_c_includes)
LOCAL_CFLAGS := $(libext2fs_cflags)
LOCAL_MODULE := libext2fs
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(libext2fs_src_files)
LOCAL_STATIC_LIBRARIES := $(libext2fs_static_libraries) $(libext2fs_system_static_libraries) libsparse_static libz
LOCAL_C_INCLUDES := $(libext2fs_c_includes)
LOCAL_EXPORT_C_INCLUDE_DIRS := $(libext2fs_c_includes)
LOCAL_CFLAGS := $(libext2fs_cflags) $(libext2fs_cflags_linux)
LOCAL_MODULE := libext2fs
LOCAL_MODULE_TAGS := optional

include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(libext2fs_src_files)
LOCAL_WHOLE_STATIC_LIBRARIES := libext2_com_err-host
LOCAL_STATIC_LIBRARIES := libsparse_host libz
LOCAL_C_INCLUDES := $(libext2fs_c_includes)
LOCAL_EXPORT_C_INCLUDE_DIRS := $(libext2fs_c_includes)
LOCAL_CFLAGS := $(libext2fs_cflags)
LOCAL_MODULE := libext2fs-host
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_HOST_OS := darwin linux windows
LOCAL_CFLAGS_windows := -isystem external/e2fsprogs/include/nonunix -Wno-format
LOCAL_LDLIBS_windows := -lws2_32

include $(BUILD_HOST_SHARED_LIBRARY)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(libext2fs_src_files)
LOCAL_WHOLE_STATIC_LIBRARIES := libext2_com_err-host
LOCAL_STATIC_LIBRARIES := libsparse_host libz
LOCAL_C_INCLUDES := $(libext2fs_c_includes)
LOCAL_EXPORT_C_INCLUDE_DIRS := $(libext2fs_c_includes)
LOCAL_CFLAGS := $(libext2fs_cflags) $(libext2fs_cflags_linux)
LOCAL_MODULE := libext2fs-host
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_HOST_OS := darwin linux windows
LOCAL_CFLAGS_windows := -isystem external/e2fsprogs/include/nonunix -Wno-format
LOCAL_LDLIBS_windows := -lws2_32

include $(BUILD_HOST_STATIC_LIBRARY)
