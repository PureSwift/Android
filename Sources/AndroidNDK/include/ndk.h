#pragma once

#include <android/log.h>
#include <android/looper.h>
#include <android/choreographer.h>
#include <android/native_activity.h>

// needed for AndroidSystem
#include <sys/epoll.h>
#include <sys/eventfd.h>
#include <sys/stat.h>
#include <sys/socket.h>
#include <sys/sysinfo.h>
#include <sys/timerfd.h>
#include <sys/types.h>
#include <errno.h>
#include <fcntl.h>
#include <pthread.h>
#include <sched.h>
#include <unistd.h>
