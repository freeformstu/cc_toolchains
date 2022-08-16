#include "clang_format_utils.h"

#include <stdio.h>
#if defined(_WIN32)
#include <direct.h>
#include <windows.h>
#else
#include <unistd.h>
#endif

#include <cstdlib>
#include <fstream>
#include <iostream>

#if defined(_WIN32)
#define IS_WINDOWS true
#define getcwd _getcwd
#define chdir _chdir
#else
#define IS_WINDOWS false
#endif

// A generated header which provides WORKSPACE_NAME
#include WORKSPACE_HEADER

namespace clang_format_utils
{
    std::string get_working_path()
    {
        char temp[1024];
        return (getcwd(temp, sizeof(temp)) ? std::string(temp)
                                           : std::string(""));
    }

    std::string runfile_key(const std::string &path)
    {
        std::string key = WORKSPACE_NAME;
        key += "/";
        if (path.rfind("./") == 0)
        {
            // Drop the `./` prefix
            key += path.substr(2, path.size());
        }
        else
        {
            key += path;
        }

        return key;
    }

    int set_current_dir(const std::string &path)
    {
        return chdir(path.c_str());
    }

    /**
     * @brief Check if a directory exists.
     *
     * No sanitization is done on the given path.
     *
     * @param path
     *  The path to check.
     * @return bool
     *  true if the path given is a directory and exists.
     */
    bool win_dir_exists(const std::string &path)
    {
#ifdef _WIN32
        DWORD attrs = GetFileAttributesA(path.c_str());

        // Unexpected result
        if (attrs == INVALID_FILE_ATTRIBUTES)
            return false;

        // Path is a directory
        if (attrs & FILE_ATTRIBUTE_DIRECTORY)
            return true;  // this is a directory!

        // Path is not a directory
        return false;
#else
        // For non windows platforms, this always returns false.
        return false;
#endif
    }

    int win_copy_file(std::string src, std::string dest)
    {
        // Normalize paths on windows
        size_t src_pos;
        while ((src_pos = src.find('/')) != std::string::npos)
        {
            src.replace(src_pos, 1, "\\");
        }
        size_t dest_pos;
        while ((dest_pos = dest.find('/')) != std::string::npos)
        {
            dest.replace(dest_pos, 1, "\\");
        }

        // Create parent directory
        size_t sep_pos = dest.rfind("\\");
        if (sep_pos != std::string::npos)
        {
            std::string parent_dir = dest.substr(0, sep_pos);

            if (!win_dir_exists(parent_dir))
            {
                std::string mkdir_command = std::string("mkdir " + parent_dir);
                int exit_code = system(mkdir_command.c_str());
                if (exit_code)
                {
                    return exit_code;
                }
            }
        }

        // Write the bytes of the source file to the dest file.
        std::ifstream src_stream(src, std::ios::binary);
        std::ofstream dst_stream(dest, std::ios::binary);
        dst_stream << src_stream.rdbuf();

        return 0;
    }

    int unix_copy_file(const std::string &src, const std::string &dest)
    {
        // Create parent directory
        size_t sep_pos = dest.rfind("/");
        if (sep_pos != std::string::npos)
        {
            std::string parent_dir = dest.substr(0, sep_pos);

            std::string mkdir_command = std::string("mkdir -p " + parent_dir);
            int exit_code = system(mkdir_command.c_str());
            if (exit_code)
            {
                return exit_code;
            }
        }

        // Write the bytes of the source file to the dest file.
        std::ifstream src_stream(src, std::ios::binary);
        std::ofstream dst_stream(dest, std::ios::binary);
        dst_stream << src_stream.rdbuf();

        return 0;
    }

    int copy_file(const std::string &src, const std::string &dest)
    {
        if (IS_WINDOWS)
        {
            return win_copy_file(src, dest);
        }
        else
        {
            return unix_copy_file(src, dest);
        }
    }

}  // namespace clang_format_utils
