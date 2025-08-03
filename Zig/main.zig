const std = @import("std");
const net = std.net;
const http = std.http;

pub fn main() !void {
    // Initialize a general-purpose allocator
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    // Create server
    const address = try net.Address.parseIp("127.0.0.1", 8080);
    var server = net.StreamServer.init(.{
        .reuse_address = true,
    });
    defer server.deinit();

    try server.listen(address);

    std.debug.print("Server running on http://{s}\n", .{address});

    // Main server loop
    while (true) {
        var response = try server.accept();
        defer response.stream.close();

        // Handle each connection in a new thread
        try std.Thread.spawn(.{}, handleConnection, .{allocator, response});
    }
}

fn handleConnection(allocator: std.mem.Allocator, response: net.StreamServer.Connection) !void {
    var reader = response.stream.reader();
    var writer = response.stream.writer();

    // Read request (simplified)
    var buffer: [1024]u8 = undefined;
    _ = try reader.read(&buffer);

    // Send response
    try writer.writeAll(
        \\HTTP/1.1 200 OK
        \\Content-Type: text/plain
        \\Connection: close
        \\
        \\Hello from Zig server!
    );
}
