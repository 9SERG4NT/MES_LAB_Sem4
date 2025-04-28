MOV A, #51H  
ADD A, #10H  
MOV R0, A  

MOV A, #51H  
CLR C  
SUBB A, #10H  
MOV R1, A  

MOV A, #51H  
MOV B, #10H  
MUL AB  
MOV R2, A  
MOV R3, B  

MOV A, #51H  
MOV B, #10H  
DIV AB  
MOV R4, A  
MOV R5, B  
