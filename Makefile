SRC = src
CEPH_SRC = ceph/src
BUILD = build
BIN = bin

CC        = gcc
CPP       = g++

PTHREAD=pthreadgce2
BOOST_VER=1_58

# Change the following directories according to your environment
HOME=$(USERPROFILE)
INCLUDE_BASE=$(HOME)/Downloads
BOOST_BASE_PATH=$(INCLUDE_BASE)/boost_$(BOOST_VER)_0
PTHREADS_BASE_PATH=$(INCLUDE_BASE)/pthreads-win32/prebuilt-dll-2-9-1-release
NSS_BASE_PATH=$(INCLUDE_BASE)/nss-3.19.1/dist
GLIB_BASE_PATH=$(INCLUDE_BASE)/glib-dev_2.34.3-1_win32

CEPH_INCLUDE = -I$(SRC) -I$(CEPH_SRC) -I$(NSS_BASE_PATH)/public/nss -I$(NSS_BASE_PATH)/WIN954.0_DBG.OBJ/include -I$(BOOST_BASE_PATH) -I$(PTHREADS_BASE_PATH)/include -l$(PTHREAD)
CFLAGS   = $(CEPH_INCLUDE) -lws2_32 -D__USE_FILE_OFFSET64 -DHAVE_CONFIG_H -D__CEPH__ -D_FILE_OFFSET_BITS=64 -D_REENTRANT -D_THREAD_SAFE -D__STDC_FORMAT_MACROS -D_GNU_SOURCE -fno-strict-aliasing -fsigned-char -fno-builtin-malloc -fno-builtin-calloc -fno-builtin-realloc -fno-builtin-free -g -DPIC
CPPFLAGS = $(CFLAGS) -Wno-invalid-offsetof
CLIBS    = -L$(PTHREADS_BASE_PATH)/dll/x86 -L$(BOOST_BASE_PATH)/stage/lib -L$(NSS_BASE_PATH)/WIN954.0_DBG.OBJ/lib -L$(GLIB_BASE_PATH)/lib

all: $(BIN)/rados_client.exe

$(BUILD)/rados_client.o:$(CEPH_SRC)/rados_client.c
	$(CC) -c $(CFLAGS) $^ -o $@
$(BUILD)/%.o:$(CEPH_SRC)/%.c
	$(CC) -c $(CFLAGS) $^ -o $@
$(BUILD)/%.o:$(CEPH_SRC)/%.cc
	$(CPP) -c $(CPPFLAGS) $^ -o $@
$(BUILD)/%.o:$(CEPH_SRC)/auth/%.cc
	$(CPP) -c $(CPPFLAGS) $^ -o $@
$(BUILD)/%.o:$(CEPH_SRC)/auth/cephx/%.cc
	$(CPP) -c $(CPPFLAGS) $^ -o $@
$(BUILD)/%.o:$(CEPH_SRC)/mon/%.cc
	$(CPP) -c $(CPPFLAGS) $^ -o $@
$(BUILD)/%.o:$(CEPH_SRC)/cls/%.cc
	$(CPP) -c $(CPPFLAGS) $^ -o $@
$(BUILD)/%.o:$(CEPH_SRC)/include/%.cc
	$(CPP) -c $(CPPFLAGS) $^ -o $@
$(BUILD)/%.o:$(CEPH_SRC)/common/%.cc
	$(CPP) -c $(CPPFLAGS) $^ -o $@
$(BUILD)/%.o:$(CEPH_SRC)/common/%.c
	$(CC) -c $(CFLAGS) $^ -o $@
$(BUILD)/%.o:$(CEPH_SRC)/librados/%.cc
	$(CPP) -c $(CPPFLAGS) $^ -o $@
$(BUILD)/%.o:$(CEPH_SRC)/log/%.cc
	$(CPP) -c $(CPPFLAGS) $^ -o $@
$(BUILD)/%.o:$(CEPH_SRC)/osdc/%.cc
	$(CPP) -c $(CPPFLAGS) $^ -o $@
$(BUILD)/%.o:$(CEPH_SRC)/osd/%.cc
	$(CPP) -c $(CPPFLAGS) $^ -o $@
$(BUILD)/%.o:$(CEPH_SRC)/msg/%.cc
	$(CPP) -c $(CPPFLAGS) $^ -o $@
$(BUILD)/%.o:$(CEPH_SRC)/%.cc
	$(CPP) -c $(CPPFLAGS) $^ -o $@
$(BUILD)/%.o:$(CEPH_SRC)/cls/%.cc
	$(CPP) -c $(CPPFLAGS) $^ -o $@
$(BUILD)/%.o:$(CEPH_SRC)/mds/%.cc
	$(CPP) -c $(CPPFLAGS) $^ -o $@
$(BUILD)/%.o:$(CEPH_SRC)/mon/%.cc
	$(CPP) -c $(CPPFLAGS) $^ -o $@
$(BUILD)/%.o:$(CEPH_SRC)/global/%.cc
	$(CPP) -c $(CPPFLAGS) $^ -o $@
$(BUILD)/%.o:$(CEPH_SRC)/crush/%.cc
	$(CPP) -c $(CPPFLAGS) $^ -o $@
$(BUILD)/%.o:$(CEPH_SRC)/crush/%.c
	$(CC) -c $(CFLAGS) $^ -o $@
$(BUILD)/%.o:$(CEPH_SRC)/cls/lock/%.cc
	$(CPP) -c $(CPPFLAGS) $^ -o $@
$(BUILD)/%.o:$(CEPH_SRC)/mds/%.cc
	$(CPP) -c $(CPPFLAGS) $^ -o $@
$(BUILD)/%.o:$(CEPH_SRC)/msg/simple/%.cc
	$(CPP) -c $(CPPFLAGS) $^ -o $@
$(BUILD)/%.o:$(CEPH_SRC)/perfglue/%.cc
	$(CPP) -c $(CFLAGS) $^ -o $@
$(BUILD)/%.o:$(CEPH_SRC)/json_spirit/%.cpp
	$(CPP) -c $(CPPFLAGS) $^ -o $@
$(BUILD)/%.o:$(CEPH_SRC)/erasure-code/%.cc
	$(CPP) -c $(CPPFLAGS) $^ -o $@

OBJECTS=  ./$(BUILD)/hash.o  ./$(BUILD)/snap_set_diff.o  ./$(BUILD)/librados.o  ./$(BUILD)/IoCtxImpl.o  ./$(BUILD)/RadosClient.o  ./$(BUILD)/RadosXattrIter.o \
 ./$(BUILD)/Objecter.o  ./$(BUILD)/MonClient.o  ./$(BUILD)/CrushWrapper.o   ./$(BUILD)/MonMap.o   ./$(BUILD)/CephxAuthorizeHandler.o  ./$(BUILD)/CephxKeyServer.o  ./$(BUILD)/CephxServiceHandler.o \
   ./$(BUILD)/mdstypes.o  ./$(BUILD)/assert.o  ./$(BUILD)/Pipe.o  ./$(BUILD)/admin_socket.o  ./$(BUILD)/Elector.o  ./$(BUILD)/Paxos.o \
  ./$(BUILD)/MDSMap.o  ./$(BUILD)/ceph_argparse.o  ./$(BUILD)/OSDMap.o  ./$(BUILD)/admin_socket_client.o   ./$(BUILD)/MonitorStore.o  ./$(BUILD)/MonMapMonitor.o  ./$(BUILD)/PaxosService.o \
 ./$(BUILD)/entity_name.o   ./$(BUILD)/ceph_context.o  ./$(BUILD)/CephxClientHandler.o  ./$(BUILD)/TextTable.o ./$(BUILD)/util.o \
 ./$(BUILD)/Message.o  ./$(BUILD)/common_init.o  ./$(BUILD)/osd_types.o  ./$(BUILD)/Messenger.o  ./$(BUILD)/MDSMonitor.o  ./$(BUILD)/OSDMonitor.o  ./$(BUILD)/PGMonitor.o  ./$(BUILD)/PGMap.o \
 ./$(BUILD)/RotatingKeyRing.o  ./$(BUILD)/CephxProtocol.o  ./$(BUILD)/CephxSessionHandler.o  ./$(BUILD)/global_context.o \
 ./$(BUILD)/LogClient.o   ./$(BUILD)/AuthMethodList.o  ./$(BUILD)/ceph_strings.o ./$(BUILD)/AuthMonitor.o ./$(BUILD)/ErasureCode.o ./$(BUILD)/ErasureCodePlugin.o \
 ./$(BUILD)/Formatter.o   ./$(BUILD)/escape.o  ./$(BUILD)/ceph_crypto.o  ./$(BUILD)/builder.o ./$(BUILD)/ConfigKeyService.o \
 ./$(BUILD)/Timer.o   ./$(BUILD)/BackTrace.o  ./$(BUILD)/hex.o  ./$(BUILD)/crush.o ./$(BUILD)/AuthServiceHandler.o \
 ./$(BUILD)/Finisher.o  ./$(BUILD)/Throttle.o  ./$(BUILD)/ceph_fs.o  ./$(BUILD)/mapper.o ./$(BUILD)/LogMonitor.o ./$(BUILD)/HealthMonitor.o \
 ./$(BUILD)/ceph_frag.o  ./$(BUILD)/config.o  ./$(BUILD)/MonCap.o   ./$(BUILD)/Filer.o ./$(BUILD)/DataHealthService.o  \
 ./$(BUILD)/types.o   ./$(BUILD)/Crypto.o  ./$(BUILD)/str_map.o  ./$(BUILD)/json_spirit_reader.o  ./$(BUILD)/json_spirit_writer.o \
 ./$(BUILD)/errno.o   ./$(BUILD)/snap_types.o  ./$(BUILD)/Striper.o ./$(BUILD)/Monitor.o \
 ./$(BUILD)/buffer.o  ./$(BUILD)/Mutex.o  ./$(BUILD)/hash.o  ./$(BUILD)/ObjectCacher.o ./$(BUILD)/CrushTester.o \
 ./$(BUILD)/lockdep.o  ./$(BUILD)/perf_counters.o  ./$(BUILD)/Clock.o  ./$(BUILD)/signal_handler.o \
 ./$(BUILD)/armor.o  ./$(BUILD)/AuthClientHandler.o  ./$(BUILD)/LogEntry.o \
 ./$(BUILD)/environment.o  ./$(BUILD)/safe_io.o  ./$(BUILD)/strtol.o \
 ./$(BUILD)/simple_spin.o   ./$(BUILD)/Clock.o  ./$(BUILD)/Journaler.o \
 ./$(BUILD)/page.o  ./$(BUILD)/sctp_crc32.o  ./$(BUILD)/crc32c.o  ./$(BUILD)/cmdparse.o \
 ./$(BUILD)/KeyRing.o  ./$(BUILD)/RefCountedObj.o  ./$(BUILD)/str_list.o \
 ./$(BUILD)/Thread.o  ./$(BUILD)/code_environment.o  ./$(BUILD)/SimpleMessenger.o \
 ./$(BUILD)/io_priority.o  ./$(BUILD)/signal.o  ./$(BUILD)/cls_lock_client.o \
 ./$(BUILD)/ConfUtils.o  ./$(BUILD)/utf8.o  ./$(BUILD)/hobject.o \
 ./$(BUILD)/bloom_filter.o  ./$(BUILD)/DecayCounter.o  ./$(BUILD)/inode_backtrace.o \
 ./$(BUILD)/msg_types.o  ./$(BUILD)/SubsystemMap.o  ./$(BUILD)/uuid.o \
 ./$(BUILD)/HitSet.o   ./$(BUILD)/Log.o  ./$(BUILD)/PrebufferedStreambuf.o  ./$(BUILD)/version.o \
 ./$(BUILD)/Accepter.o  ./$(BUILD)/DispatchQueue.o   ./$(BUILD)/PipeConnection.o  ./$(BUILD)/dout.o \
 ./$(BUILD)/AuthSessionHandler.o  ./$(BUILD)/histogram.o  ./$(BUILD)/ceph_hash.o  ./$(BUILD)/addr_parsing.o  ./$(BUILD)/cmdparse.o

$(BIN)/rados.dll:$(OBJECTS)
	$(CPP) $(CFLAGS) $(CLIBS) -shared -o $@ $^ -lbws2_32 -lpthreadGCE2 -lgio-2.0 -lglib-2.0 -lgobject-2.0 -lnss3 -lnss -lnspr4 -lfreebl3 -lnssckbi -lnssutil3 -lplc4 -lssl3 \
	-lboost_thread-mgw48-mt-$(BOOST_VER) -lboost_atomic-mgw48-mt-$(BOOST_VER) -lboost_log-mgw48-mt-$(BOOST_VER) -lboost_system-mgw48-mt-$(BOOST_VER)

$(BIN)/rados_client.exe:$(BUILD)/rados_client.o $(BIN)/rados.dll
	$(CPP) $(CFLAGS) $(CLIBS) -o $@ $^ -unicode -lws2_32 -l$(PTHREAD) -lgio-2.0 -lglib-2.0 -lgobject-2.0 \
	-lboost_thread-mgw48-mt-$(BOOST_VER) -lboost_atomic-mgw48-mt-$(BOOST_VER) -lboost_log-mgw48-mt-$(BOOST_VER) -lboost_system-mgw48-mt-$(BOOST_VER)

clean:
	del $(OBJECTS)
	rm -f $(BUILD)\*.o
	del $(BIN)\rados.dll
	del $(BIN)\rados_client.exe
