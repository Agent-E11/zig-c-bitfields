const std = @import("std");
const print = std.debug.print;

const c_lib = @cImport({
    @cInclude("lib.h");
});

fn printBytes(v: anytype) void {
    const ptr: [*]u8 = @ptrCast(@constCast(&v));

    for (0..@sizeOf(@TypeOf(v))) |i| {
        const byte: u8 = ptr[i];
        print("{b:0>8} ", .{byte});
    }
    print("\n", .{});
}

const Value = packed struct {
    a: u3,
    b: u4,
    c: bool,
    d: u4,
};

pub fn main() !void {
    const v: Value = .{
        .a = 3,
        .b = 13,
        .c = true,
        .d = 1,
    };

    // const c_v: c_lib.CValue = c_lib.CValue{
    //     .a = 3,
    //     .b = 13,
    //     .c = true,
    //     .d = 1,
    // };

    const c_v = c_lib.create_c_value();

    print("{}\n", .{v});
    print("size: {}\n", .{@sizeOf(Value)});

    printBytes(v);

    print("{}\n", .{c_v});
    print("size: {}\n", .{@sizeOf(c_lib.CValue)});

    printBytes(c_v);
}
