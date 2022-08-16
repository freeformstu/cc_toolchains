#ifndef _CLANG_FORMAT_UTILS_H_INCLUDE_
#define _CLANG_FORMAT_UTILS_H_INCLUDE_

#include <string>
#include <vector>

namespace clang_format_utils
{
    /**
     * @brief Get the working path object
     *
     * @return std::string
     *  The current working directory.
     */
    std::string get_working_path();

    /**
     * @brief Generate a runfile key to use with `@rules_cc//cc:runfiles`.
     *
     * This function does not do any sanitization for `path`.
     *
     * @param path
     *  The runfile path, minus the workspace name.
     * @return int
     *  The runfile key based on the current workspace.
     */
    std::string runfile_key(const std::string &path);

    /**
     * @brief Changes the current working directory to the specified path.
     *
     * @param path
     *  The path to change the workign directory to.
     * @return int
     *  The exit code of the command.
     */
    int set_current_dir(const std::string &path);

    /**
     * @brief Copy a file to a new destination.
     *
     * If the parent directory of `dest` does not exist, it will be made. This
     * function will also sanitize paths, replacing `/` on windows with `\`.
     *
     * @param src
     *  The file to copy.
     * @param dest
     *  The location where to copy the file to.
     * @return int
     *  The exit code of the copy command.
     */
    int copy_file(const std::string &src, const std::string &dest);

}  // namespace clang_format_utils

#endif
