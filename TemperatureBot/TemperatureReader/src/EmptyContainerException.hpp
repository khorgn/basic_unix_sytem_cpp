#ifndef EMPTY_CONTAINER_EXCEPTION_HPP
#define EMPTY_CONTAINER_EXCEPTION_HPP

#include <exception>
#include <stdexcept>
#include <string>

/* namespace TemperatureBot
{
	class EmptyContainerException :
		public std::exception
	{
	public:
		EmptyContainerException(std::string m = "Empty Container Exception") : m_message(m) {}
		~EmptyContainerException() noexcept {}
		const char* what() const noexcept { return m_message.c_str(); }
	private:
		std::string m_message;
	};
} */

namespace TemperatureBot
{
    class EmptyContainerException : public std::runtime_error
    {
        public:
        EmptyContainerException(const std::string& msg) : std::runtime_error(msg) {}
        EmptyContainerException(const char* msg) : std::runtime_error(msg) {}
    };
}

#endif // EMPTY_CONTAINER_EXCEPTION_HPP