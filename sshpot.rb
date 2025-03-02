require 'socket'

server_name = 'localhost' #hostname


def find_available_port #find an available port between 1025 and 65534
    begin 
        port = rand(1025..65534) 
        server = TCPServer.new('localhost', port)

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