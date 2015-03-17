#ifndef CEPH_ERRNO_H
#define CEPH_ERRNO_H

#include <string>

/* Return a given error code as a string */
std::string cpp_strerror(int err);

#ifdef _WIN32
#define EADDRINUSE 9902
#endif

#endif