module taxiMeter1(clock, mode, vip_enable, reset_income, seat_0, seat_1, seat_2, seat_3, s0cost, s1cost, s2cost, s3cost, vip_cost, total_income, rainyWeather);
	input clock, mode, vip_enable, reset_income, rainyWeather;
	//mode == 1 -> motion , mode == 0 -> stop;
	input seat_0, seat_1, seat_2, seat_3;
	output reg [31:0] s0cost, s1cost, s2cost, s3cost, vip_cost;
	output reg [31:0] total_income;
	initial 
	begin
		s0cost = 1'd0;
		s1cost = 1'd0;
		s2cost = 1'd0;
		s3cost = 1'd0;
		vip_cost = 1'd0;
		total_income = 1'd0;
	end
	always  @(posedge clock or posedge reset_income)
	begin
		if(vip_enable == 1'b0)
		begin
			
			vip_cost = 1'd0;
			if(seat_0 == 1'b1)
			begin
				if(s0cost == 1'd0)
				begin
					s0cost = rainyWeather? 5'd15 : 5'd10;
					total_income = total_income + rainyWeather? 5'd15 : 5'd10;
				end
				if(mode == 1)
				begin
					s0cost = s0cost + rainyWeather? 5'd10 : 5'd9;
					total_income = total_income + rainyWeather? 5'd10 : 5'd9;
				end
				else
				begin
					s0cost = s0cost + rainyWeather? 5'd7 : 5'd6;
					total_income = total_income + rainyWeather? 5'd7 : 5'd6;
				end
			
			end
			//-----------------------------------
			if(seat_1 == 1'b1)
			begin
				if(s1cost == 1'd0)
				begin
					s1cost = rainyWeather? 5'd15 : 5'd10;
					total_income = total_income + rainyWeather? 5'd15 : 5'd10;
				end
				if(mode == 1)
				begin
					s1cost = s1cost + rainyWeather? 5'd9 : 5'd8;
					total_income = total_income + rainyWeather? 5'd9 : 5'd8;
				end
				else
				begin
					s1cost = s1cost + rainyWeather? 5'd6 : 5'd5;
					total_income = total_income + rainyWeather? 5'd6 : 5'd5;
				end
			end
			
			//-----------------------------------
			if(seat_2 == 1'b1)
			begin
				if(s2cost == 1'd0)
				begin
					s2cost = rainyWeather? 5'd15 : 5'd10;
					total_income = total_income + rainyWeather? 5'd15 : 5'd10;
				end
				if(mode == 1)
				begin
					s2cost = s2cost + rainyWeather? 5'd9 : 5'd8;
					total_income = total_income + rainyWeather? 5'd9 : 5'd8;
				end
				else
				begin
					s2cost = s2cost + rainyWeather? 5'd6 : 5'd5;
					total_income = total_income + rainyWeather? 5'd6 : 5'd5;
				end
			end
			
			//-----------------------------------
			if(seat_3 == 1'b1)
			begin
				if(s3cost == 1'd0)
				begin
					s3cost = rainyWeather? 5'd15 : 5'd10;
					total_income = total_income + rainyWeather? 5'd15 : 5'd10;
				end
				if(mode == 1)
				begin
					s3cost = s3cost + rainyWeather? 5'd9 : 5'd8;
					total_income = total_income + rainyWeather? 5'd9 : 5'd8;
				end
				else
				begin
					s3cost = s3cost + rainyWeather? 5'd6 : 5'd5;
					total_income = total_income + rainyWeather? 5'd6 : 5'd5;
				end
			end
			
		end
		else
		begin
			
			s0cost = 1'd0;
			s1cost = 1'd0;
			s2cost = 1'd0;
			s3cost = 1'd0;
			if(vip_cost == 1'd0)
			begin
				vip_cost = rainyWeather? 5'd15 : 5'd10;
				total_income = total_income + rainyWeather? 5'd15 : 5'd10;
			end
			if(mode == 1)
			begin
				vip_cost = vip_cost + rainyWeather? 5'd19 : 5'd16;
				total_income = total_income + rainyWeather? 5'd19 : 5'd16;
			end
			else
			begin
				vip_cost = vip_cost + rainyWeather? 5'd6 : 5'd5;
				total_income = total_income + rainyWeather? 5'd6 : 5'd5;
			end		
		end

		if(reset_income == 1'b1)
		begin
			s0cost = 1'd0;
			s1cost = 1'd0;
			s2cost = 1'd0;
			s3cost = 1'd0;
			vip_cost = 1'd0;
			total_income = 5'd0;
		end
		if(total_income > 14'b10011100010000)
		begin
			total_income = 1'd0;
			s0cost = 1'd0;
			s1cost = 1'd0;
			s2cost = 1'd0;
			s3cost = 1'd0;
			vip_cost = 5'd0;
		end
		
	end
endmodule
