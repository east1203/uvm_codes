class c_14_3;
    bit[15:0] tmp2 = 16'h179;
    rand bit[7:0] B; // rand_mode = ON 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (seq/seq_fabonacci.sv:24)
    {
       (B == tmp2);
    }
endclass

program p_14_3;
    c_14_3 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "11zz1z1zxxxx1zxxz1xzzzz11zxzxzz1xxzxzzzzxzzxxzxxxxzzxzxzxxzzzzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
