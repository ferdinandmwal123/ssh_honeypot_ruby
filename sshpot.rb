require 'socket'

server_name = 'localhost' #hostname

class MainClass
#TODO (01) : Not sure this is necessary for this use case
def find_available_port #find an available port between 1025 and 65534z 
    begin 
        port = rand(1025..65534) 
        server = TCPServer.new('localhost', port)
        server.close # close server if port is available
        return port
    rescue SocketError, Errno::EADDRINUSE => e
        puts "There has neen an error #{e}"
        puts "Most likely port no #{port} is already in use"
        puts "Retrying..."
        retry
    end
end

port_to_use = find_available_port
puts "Port to use: #{port_to_use}"


def socket(server_name, port_to_use)
    server_socket = Socket.new(AF_INET, SOCK_STREAM, 0)
    server_socket.setsockopt(Socket::SOL_SOCKET, Socket::SO_REUSEADDR, true) #allow address reuse
    gets.chomp
end




