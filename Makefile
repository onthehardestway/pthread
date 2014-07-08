CC=gcc
CFLAGS=-g -Wall -std=c99 -DDEBUG -D_XOPEN_SOURCE=500
LDFLAGS=-lpthread

SOURCES=alarm.c alarm_fork.c alarm_thread.c thread_error.c lifecycle.c mutex_static.c mutex_dynamic.c\
	alarm_mutex.c trylock.c backoff.c cond_static.c cond_dynamic.c cond.c alarm_cond.c

PROGRAMS=$(SOURCES:.c=)

all:	${PROGRAMS}

%: %.c
	$(CC) $(CFLAGS) $< -o $@ $(LDFLAGS)

clean:
	@rm -rf $(PROGRAMS) *.o
recompile: clean all
