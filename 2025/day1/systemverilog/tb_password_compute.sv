`timescale 1ns / 1ps

module tb_password_compute();

    logic clk, rst_n;

    logic signed [31:0] dial_start; // Start of dial number
    logic signed [31:0] distance;
    logic direction;
    logic [31:0]  password;

    initial begin
        clk = 0; rst_n = 0;
        forever #5ns clk = ~clk;
    end

    password_compute dut(
        .clk(clk),
        .rst_n(rst_n),
        .dial_start(dial_start),
        .distance(distance),
        .direction(direction),
        .password(password)
    );

    initial begin
        dial_start = 'd50; distance = 0; direction = 'Z;
        repeat(5) @(posedge clk);
        rst_n = 1;

        repeat(2) @(posedge clk); // wait for dial_start loaded

        @(posedge clk) #0 direction = 0; distance = 'd68;
        $display("@%0t: Direction = %0d, Distance = %0d, password = %0d", $time, direction, distance, password);

        @(posedge clk) #0 direction = 0; distance = 'd30;
        $display("@%0t: Direction = %0d, Distance = %0d, password = %0d", $time, direction, distance, password);

        @(posedge clk) #0 direction = 1; distance = 'd48;
        $display("@%0t: Direction = %0d, Distance = %0d, password = %0d", $time, direction, distance, password);

        @(posedge clk) #0 direction = 0; distance = 'd5;
        $display("@%0t: Direction = %0d, Distance = %0d, password = %0d", $time, direction, distance, password);

        @(posedge clk) #0 direction = 1; distance = 'd60;
        $display("@%0t: Direction = %0d, Distance = %0d, password = %0d", $time, direction, distance, password);

        @(posedge clk) #0 direction = 0; distance = 'd55;
        $display("@%0t: Direction = %0d, Distance = %0d, password = %0d", $time, direction, distance, password);

        @(posedge clk) #0 direction = 0; distance = 'd1;
        $display("@%0t: Direction = %0d, Distance = %0d, password = %0d", $time, direction, distance, password);

        @(posedge clk) #0 direction = 0; distance = 'd99;
        $display("@%0t: Direction = %0d, Distance = %0d, password = %0d", $time, direction, distance, password);

        @(posedge clk) #0 direction = 1; distance = 'd14;
        $display("@%0t: Direction = %0d, Distance = %0d, password = %0d", $time, direction, distance, password);

        @(posedge clk) #0 direction = 0; distance = 'd82;
        $display("@%0t: Direction = %0d, Distance = %0d, final password = %0d", $time, direction, distance, password);
        // Password = 3
        
        assert(password == 3) $display("PASSED: Password = %0d is correct", password); else $display("FAILED: Password = %0d is wrong, supposedly 3", password);

        @(posedge clk) #0 direction = 0; distance = 'd0;
        repeat(2) @(posedge clk);
        $finish;
    end
    

endmodule
