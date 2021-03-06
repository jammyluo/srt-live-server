SHELL = /bin/sh
MAIN_NAME=sls
INC_PATH = -I./ -I../ -I./slscore -I./include
LIB_PATH =  -L ./lib
LIBRARY_FILE = -lpthread -lz -lsrt
BIN_PATH = ./bin

DEBUG = -g
CFLAGS += $(DEBUG)

OUTPUT_PATH = ./obj

OBJS = $(OUTPUT_PATH)/SLSLog.o \
	$(OUTPUT_PATH)/common.o\
	$(OUTPUT_PATH)/conf.o\
	$(OUTPUT_PATH)/SLSThread.o\
	$(OUTPUT_PATH)/SLSEpollThread.o\
	$(OUTPUT_PATH)/SLSManager.o\
	$(OUTPUT_PATH)/SLSGroup.o\
	$(OUTPUT_PATH)/SLSRole.o\
	$(OUTPUT_PATH)/SLSListener.o\
	$(OUTPUT_PATH)/SLSRoleList.o\
	$(OUTPUT_PATH)/SLSSrt.o\
	$(OUTPUT_PATH)/SLSPublisher.o\
	$(OUTPUT_PATH)/SLSPlayer.o\
	$(OUTPUT_PATH)/SLSRecycleList.o\

				
	
CORE_PATH = slscore
COMMON_FILES = common.hpp

all: $(OBJS)
	mkdir -p ${BIN_PATH}
	g++ -o ${BIN_PATH}/${MAIN_NAME} srt-live-server.cpp $(OBJS) $(CFLAGS) $(INC_PATH) $(LIB_PATH) $(LIBRARY_FILE)
	#******************************************************************************#
	#                          Bulid successful !                                  #
	#******************************************************************************#

$(OUTPUT_PATH)/common.o: ./$(CORE_PATH)/common.cpp
	g++ -c $(CFLAGS) $< -o $@ $(INC_FLAGS)

$(OUTPUT_PATH)/conf.o: ./$(CORE_PATH)/conf.cpp
	g++ -c $(CFLAGS) $< -o $@ $(INC_FLAGS)

$(OUTPUT_PATH)/SLSLog.o: ./$(CORE_PATH)/SLSLog.cpp
	g++ -c $(CFLAGS) $< -o $@ $(INC_FLAGS)
	
$(OUTPUT_PATH)/SLSThread.o: ./$(CORE_PATH)/SLSThread.cpp 
	g++ -c $(CFLAGS) $< -o $@ $(INC_PATH)
	
$(OUTPUT_PATH)/SLSEpollThread.o: ./$(CORE_PATH)/SLSEpollThread.cpp 
	g++ -c $(CFLAGS) $< -o $@ $(INC_PATH)
	
$(OUTPUT_PATH)/SLSManager.o: ./$(CORE_PATH)/SLSManager.cpp 
	g++ -c $(CFLAGS) $< -o $@ $(INC_PATH)
	
$(OUTPUT_PATH)/SLSGroup.o: ./$(CORE_PATH)/SLSGroup.cpp 
	g++ -c $(CFLAGS) $< -o $@ $(INC_PATH)
	
$(OUTPUT_PATH)/SLSRole.o: ./$(CORE_PATH)/SLSRole.cpp 
	g++ -c $(CFLAGS) $< -o $@ $(INC_FLAGS)
	
$(OUTPUT_PATH)/SLSListener.o: ./$(CORE_PATH)/SLSListener.cpp 
	g++ -c $(CFLAGS) $< -o $@ $(INC_PATH)
	
$(OUTPUT_PATH)/SLSRoleList.o: ./$(CORE_PATH)/SLSRoleList.cpp 
	g++ -c $(CFLAGS) $< -o $@ $(INC_PATH)
	
$(OUTPUT_PATH)/SLSSrt.o: ./$(CORE_PATH)/SLSSrt.cpp 
	g++ -c $(CFLAGS) $< -o $@ $(INC_PATH)
	
$(OUTPUT_PATH)/SLSPublisher.o: ./$(CORE_PATH)/SLSPublisher.cpp 
	g++ -c $(CFLAGS) $< -o $@ $(INC_PATH)
	
$(OUTPUT_PATH)/SLSPlayer.o: ./$(CORE_PATH)/SLSPlayer.cpp 
	g++ -c $(CFLAGS) $< -o $@ $(INC_PATH)

$(OUTPUT_PATH)/SLSRecycleList.o: ./$(CORE_PATH)/SLSRecycleList.cpp 
	g++ -c $(CFLAGS) $< -o $@ $(INC_PATH)
	
clean:
	rm -f $(OUTPUT_PATH)/*.o

