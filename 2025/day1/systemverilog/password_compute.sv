module password_compute (
    input logic clk, rst_n,
    input logic signed [31:0] dial_start, // Current position of the dial
    input logic signed [31:0] distance, // Number of steps to turn left/right
    input logic direction, // 0 - left (lower number), 1 - right (higher number)
    output logic [31:0]  password
);
    logic signed [31:0] curr_dial; // 0-99
    logic signed [31:0] temp_dial;

    logic [31:0] curr_count;
    
    logic init_done;

    always_ff @(posedge clk or negedge rst_n) begin : process_rotation
        if (!rst_n) begin
            curr_dial <= 0;
            curr_count <= 0;
            init_done <= 0;
        end else begin
            if (!init_done) begin
                curr_dial <= dial_start;
                init_done <= 1;
            end else begin
                if (temp_dial == 'd0) begin
                    curr_count <= curr_count+1;
                end
                
                curr_dial <= temp_dial;
            end
        end
    end
    
    always_comb begin
        temp_dial = direction ? (curr_dial + distance) : (curr_dial - distance);
        
        // wrap 0..99
        if (temp_dial < 0) begin
            temp_dial = temp_dial + 100;
        end else if (temp_dial >= 100) begin
            temp_dial = temp_dial - 100;
        end
    end
    
    assign password = curr_count;

        
endmodule