 DATA SEGMENT
    LIST DB 21H,31H,15H,13H
    COUNT EQU 04H
    LARGEST DB ?
DATA ENDS
ASSUME CS:CODE,DS:DATA
CODE SEGMENT        
START:
    MOV AX,DATA
    MOV DS,AX
    MOV SI,OFFSET LIST
    MOV CL,COUNT 
    MOV AL,[SI]
    AGAIN: CMP AL,[SI+1]
    JNL NEXT
    MOV AL,[SI+1]
    NEXT:INC SI
    DEC CL
    JNZ AGAIN    
    MOV SI,OFFSET LARGEST
    MOV [SI],AL    
    MOV AH,4CH
    INT 21H
CODE ENDS
END START
