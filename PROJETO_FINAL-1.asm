TITLE BATALHA NAVAL
.MODEL SMALL
    ;macro feito para imprimir mensagens, repete inumeras vezes
IMPRIMIR MACRO MSG

    MOV AH,9
    LEA DX,MSG
    INT 21h

ENDM
    ;macro feito para pedir caracter, repete inumeras vezes
PEDIR_CHAR MACRO

    MOV AH,1
    INT 21h

ENDM
    ;macro feito para pular uma linha
PULAR_LINHA MACRO

    PUSH AX
    PUSH DX

    MOV AH,2
    MOV DL,10
    INT 21h

    MOV AH,2
    MOV DL,13
    INT 21h

    POP DX
    POP AX

ENDM
    ;por repetir varias vezes durante o programa, fizemos esse macro para zerar registradores de nossa escolha
ZERAR MACRO R1,R2

    XOR R1,R1
    XOR R2,R2

ENDM
    ;por repetir varias vezes, fizemos o macro de zerar SI e quantificar CX por 20 (quantidade de colunas)
DEFINIR_CX MACRO

    XOR SI,SI
    OR CX,14h

ENDM
    ;por repetir varias vezes, fizemos o macro de adicionar 40 em BX, o que é o mesmo de pular uma linha na matriz, além de 
    ;diminuir DI, que é o contador de linhas
ADICIONAR_BX MACRO

    ADD BX,28h
    DEC DI

ENDM
    ;macro para salvar registradores na pilha
SAVE_REGS MACRO

    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX

ENDM
    ;macro para carregar os registradores salvos da pilha
LOAD_REGS MACRO

    POP DX
    POP CX
    POP BX
    POP AX

ENDM
    ;macro para terminar o programa
TERMINO MACRO

    MOV AH,4Ch
    INT 21h

ENDM

.STACK 100h
.DATA

    MAPA DW 20 DUP (0)
         DW 20 DUP (0)
         DW 20 DUP (0)
         DW 20 DUP (0)
         DW 20 DUP (0)
         DW 20 DUP (0)
         DW 20 DUP (0)
         DW 20 DUP (0)
         DW 20 DUP (0)
         DW 20 DUP (0)
         DW 20 DUP (0)
         DW 20 DUP (0)
         DW 20 DUP (0)
         DW 20 DUP (0)
         DW 20 DUP (0)
         DW 20 DUP (0)
         DW 20 DUP (0)
         DW 20 DUP (0)
         DW 20 DUP (0)
         DW 20 DUP (0)

    MAPA1 DW 20 DUP (0)
          DW 20 DUP (0)                                      
          DW 20 DUP (0)                                      
          DW 20 DUP (0)                                      
          DW 8 DUP (0), 4 DUP (1), 8 DUP (0)                 
          DW 20 DUP (0)
          DW 4 DUP (0), 1, 11 DUP (0), 1, 3 DUP (0)
          DW 4 DUP (0), 1, 10 DUP (0), 1, 1, 3 DUP (0)
          DW 4 DUP (0), 1, 11 DUP (0), 1, 3 DUP (0)
          DW 20 DUP (0)
          DW 20 DUP (0)
          DW 20 DUP (0)
          DW 18 DUP (0), 1, 0
          DW 18 DUP (0), 1, 1
          DW 0, 1, 1, 15 DUP (0), 1, 0
          DW 9 DUP (0), 1, 1, 9 DUP(0)
          DW 20 DUP (0)
          DW 20 DUP (0)
          DW 20 DUP (0)
          DW 20 DUP (0)    
    
    MAPA2 DW 3 DUP (1), 17 DUP (0)
          DW 0, 1, 18 DUP (0)
          DW 20 DUP (0)
          DW 20 DUP (0)
          DW 8 DUP (0), 3 DUP (1), 9 DUP (0)
          DW 20 DUP (0)
          DW 20 DUP (0)
          DW 4 DUP (0), 1, 15 DUP (0)
          DW 4 DUP (0), 1, 15 DUP (0)
          DW 4 DUP (0), 1, 15 DUP (0)
          DW 4 DUP (0), 1, 15 DUP (0)
          DW 20 DUP (0)
          DW 8 DUP (0), 1, 6 DUP (0), 1, 1, 3 DUP (0)
          DW 8 DUP (0), 1, 1, 3 DUP (0), 1, 6 DUP (0)
          DW 8 DUP (0), 1, 4 DUP (0), 1, 6 DUP (0)
          DW 20 DUP (0)
          DW 20 DUP (0)
          DW 20 DUP (0)
          DW 20 DUP (0)
          DW 20 DUP (0)

    MAPA3 DW 20 DUP (0)
          DW 11 DUP (0), 1, 1, 7 DUP (0)
          DW 20 DUP (0)
          DW 20 DUP (0)
          DW 0, 1, 18 DUP (0)
          DW 0, 1, 1, 16 DUP (0), 1
          DW 0, 1, 17 DUP (0), 1
          DW 19 DUP (0), 1
          DW 19 DUP (0), 1
          DW 20 DUP (0)
          DW 7 DUP (0), 3 DUP (1), 10 DUP (0)
          DW 20 DUP (0)
          DW 20 DUP (0)
          DW 20 DUP (0)
          DW 3 DUP (0), 1, 16 DUP (0)
          DW 3 DUP (0), 1, 16 DUP (0)
          DW 20 DUP (0)
          DW 13 DUP (0), 1, 6 DUP (0)
          DW 12 DUP (0), 3 DUP (1), 5 DUP (0)
          DW 20 DUP (0)

    MAPA4 DW 20 DUP (0)
          DW 20 DUP (0)
          DW 16 DUP (0), 1, 3 DUP (0)
          DW 16 DUP (0), 1, 1, 2 DUP (0)
          DW 2 DUP (1), 14 DUP (0), 1, 3 DUP (0)
          DW 20 DUP (0)
          DW 20 DUP (0)
          DW 20 DUP (0)
          DW 3 DUP (0), 1, 5 DUP (0), 1, 10 DUP (0)
          DW 2 DUP (0), 3 DUP (1), 4 DUP (0), 1, 10 DUP (0)
          DW 9 DUP (0), 1, 10 DUP (0)
          DW 9 DUP (0), 1, 10 DUP (0)
          DW 20 DUP (0)
          DW 20 DUP (0)
          DW 15 DUP (0), 2 DUP (1), 3 DUP (0)
          DW 20 DUP (0)
          DW 20 DUP (0)
          DW 20 DUP (0)
          DW 20 DUP (0)
          DW 5 DUP (0), 3 DUP (1), 12 DUP (0)

    MAPA5 DW 20 DUP (0)
          DW 15 DUP (0), 1, 4 DUP (0)
          DW 15 DUP (0), 1, 4 DUP (0)
          DW 15 DUP (0), 1, 4 DUP (0)
          DW 15 DUP (0), 1, 4 DUP (0)
          DW 20 DUP (0)
          DW 1, 19 DUP (0)
          DW 2 DUP (1), 18 DUP (0)
          DW 1, 18 DUP (0), 1
          DW 19 DUP (0), 1
          DW 20 DUP (0)
          DW 9 DUP (0), 2 DUP (1), 9 DUP (0)
          DW 20 DUP (0)
          DW 20 DUP (0)
          DW 20 DUP (0)
          DW 20 DUP (0)
          DW 20 DUP (0)
          DW 13 DUP (0), 3 DUP (1), 4 DUP (0)
          DW 4 DUP (0), 1, 15 DUP (0)
          DW 3 DUP (0), 3 DUP (1), 14 DUP (0)

    MAPA_PC DW 20 DUP (?)
            DW 20 DUP (?)
            DW 20 DUP (?)
            DW 20 DUP (?)
            DW 20 DUP (?)
            DW 20 DUP (?)
            DW 20 DUP (?)
            DW 20 DUP (?)
            DW 20 DUP (?)
            DW 20 DUP (?)
            DW 20 DUP (?)
            DW 20 DUP (?)
            DW 20 DUP (?)
            DW 20 DUP (?)
            DW 20 DUP (?)
            DW 20 DUP (?)
            DW 20 DUP (?)
            DW 20 DUP (?)
            DW 20 DUP (?)
            DW 20 DUP (?)

    BEMVINDO DB "BEM VINDO AO JOGO DE BATALHA NAVAL!!!$"
    ENTRADA DB 10,13,"Pressione ENTER para continuar.$"
    INSTRUCAO DB 10,13,"O jogo escolheu um mapa aleatorio. O jogador deve escrever a linha e coluna do mapa para o ataque.$"
    MARCAS DB 10,13,"Ao instruir corretamente, o lugar recebera um X, caso tenha ERRADO, ou um V, caso tenha ACERTADO.$"
    LINHA DB 10,13,"Digite a linha do ataque: $"
    COLUNA DB 10,13,"Digite a coluna do ataque: $"
    ESTADO_ATUAL DB 10,13,"Seu mapa esta, no momento, dessa forma: $"   
    ERROU DB 10,13,"Passou perto, mas AGUA!$"
    ACERTOU DB 10,13,"Parabens, acertou uma das pecas! Continue assim!$"
    REPETIR DB 10,13,"Posicao ja escolhida. Escolha uma posicao diferente!$"
    FINAL DB 10,13,"VOCE GANHOOOUUU!!!$"
    INVALID DB 10,13,"Numero invalido!$"
    EXIT DB "         Quer sair? Pressione ESC $"
    PENA DB 10,13,"Vejo voce no proximo jogo!$"

.CODE
MAIN PROC
    ;move o @DATA para segmento guardando os endereços de memória das mensagens em AX, que por sua vez guarda em DS
    MOV AX,@DATA
    MOV DS,AX
    ;chama o PROC de limpar tela e imprime as mensagens de BEM VINDO, ENTRADA e EXIT. O macro de pedir caracter é apenas
    ;para pausar o programa e verificar se o caracter escolhido é ESC, o qual direciona para o final do programa e termina.
    CALL LIMPAR_TELA
    IMPRIMIR BEMVINDO
    IMPRIMIR ENTRADA
    IMPRIMIR EXIT
    PEDIR_CHAR
    CALL LIMPAR_TELA
    CMP AL,1Bh
    JE _ESC
    ;imprime as mensagens INSTRUÇÂO, MARCAS e EXIT e pede o caracter para pausar o programa e verificar se é ESC
    IMPRIMIR INSTRUCAO
    IMPRIMIR MARCAS
    IMPRIMIR ENTRADA
    IMPRIMIR EXIT
    PEDIR_CHAR
    CALL LIMPAR_TELA
    CMP AL,1Bh
    JE _ESC
    CALL LIMPAR_TELA
    ;chama o PROC BATALHA, onde se encontra todo a ação do programa, sendo o ataque no mapa, impressão do mapa, entre outros.
    ;a comparação foi feita para caso, em meio do PROC o usuário aperte ESC, envie para o final do PROC e assim voltar para o MAIN
    ;e assim, ao comparar, possa confirmar se saiu do PROC pelo ESC ou saiu por ganhar
    CALL BATALHA
    CMP AL,1Bh
    JE _ESC
    ;imprime as mensagens FINAL e ENTRADA. Pedir caracter apenas para pausar o programa
    IMPRIMIR FINAL
    IMPRIMIR ENTRADA
    PEDIR_CHAR
    ;_ESC para os jumps do MAIN; término do programa
    _ESC:
    ;imprime a mensagem PENA e termina o programa
        IMPRIMIR PENA
        TERMINO

MAIN ENDP

BATALHA PROC
    ;chama o PROC RANDOM para escolher aleatoriamente que mapa irá ser usada e chama a PROC DEFINIR_MAPA para escrever o mapa escolhido em MAPA_PC
    ;a qual está vazia.
    CALL RANDOM
    CALL DEFINIR_MAPA
    ;AX como quantidade de 1 na matriz, as quais são as peças do jogo.
    XOR AX,AX
    OR AX,13h
    ;começo do WHILE
    PARTIDA:
    ;salva AX na pilha para não perder em meio todo programa
        PUSH AX
    ;imprime as mensagens ESTADO_ATUAL e EXIT, pula uma linha e chama a PROC IMPRIMIR_MAPA, o qual irá imprimir um mapa em branco (apenas 0)
    ;assim o jogador não poderá ver o mapa que fora selecionada.
        IMPRIMIR ESTADO_ATUAL
        IMPRIMIR EXIT
        PULAR_LINHA
        XOR AX,AX
        CALL IMPRIMIR_MAPA
    ;macro para zerar BX (linha) e SI (coluna)
        ZERAR BX SI
        START:
    ;imprime LINHA e chama a PROC DECIMAL que irá dar a entrada em decimal, guardada em BX e, assim, poderá escrever mais que uma casa decimal.
    ;verifica se o caracter é ESC para poder pular para o FIM da PROC. Salva os registradores, principalmente BX, onde esta o valor da linha.
    ;POP DX e PUSH DX são exclusivamente para não atrapalhar com a pilha e procedimentos.
            IMPRIMIR LINHA
            CALL DECIMAL
            POP DX
            CMP AL,1Bh
            JE FIM
            PUSH AX
            SAVE_REGS
    ;imprime COLUNA e chama a PROC DECIMAL para dar a entrada em decimal. Move BX para SI, o qual esta o valor da coluna.
    ;verifica se o caracter é ESC. Carrega os registradores, principalmente o valor de BX.
    ;POP DX e PUSH DX são exclusivamente para não atrapalhar com a pilha e procedimentos.
            IMPRIMIR COLUNA
            CALL DECIMAL
            MOV SI,BX
            POP DX
            CMP AL,1Bh
            JE FIM
            PUSH DX
            LOAD_REGS
    ;PROC POSICAO irá mandar as posições exatas de BX e SI na matriz, que esta em tamanho WORD
            CALL POSICAO
    ;verificar se a posição escolhida jai foi marcada e manda para REPETIDO caso ja fora marcado.
            CMP MAPA[BX][SI],0
            JNE REPETIDO

            CONTINUAR:
    ;verifica se a posição escolhida acertou uma peça ou não. Caso tenha errado, o programa irá escrever um X no lugar do número que está
    ;nesta posição e imprimirá a mensagem ERROU. O pop AX serve para não atrapalhar com os endereços na pilha e procedimentos.
                CMP MAPA_PC[BX][SI],0
                JNE NAVIO
                MOV MAPA[BX][SI],58h
                IMPRIMIR ERROU
                POP AX
                JMP PROSSEGUIR

                    NAVIO:
    ;caso tenha acertado, o programa irá escrever um V no lugar do número que está nessa posição e imprimirá a mensagem ACERTOU 
    ;o pop irá trazer o valor de AX, que era a contagem de 1, e decrementará 1 na contagem. Caso a contagem chegue em zero,
    ;pulará para o final do PROC
                        IMPRIMIR ACERTOU
                        MOV MAPA[BX][SI],56h
                        POP AX
                        DEC AX
                        CMP AX,0
                        JZ FIM
                
                PROSSEGUIR:
    ;volta para o começo do PROC e começará tudo de novo
                    JMP PARTIDA
                
                    REPETIDO:
    ;caso tenha repetido a posição, irá imprimir a mensagem MENSAGEM_REPETIDA e o pop é para não atrapalhar com os endereços da pilha
    ;e procedimentos.
                        CALL MENSAGEM_REPETIDA
                        POP AX
                        JMP PARTIDA
        
                FIM:
    ;limpa a tela e retorna para onde foi chamado previamente
                    CALL LIMPAR_TELA
                    RET

BATALHA ENDP

DECIMAL PROC
    ;zera AX, onde irá receber o produto das multiplicações
    XOR AX,AX
    
    iNICIO:
    ;zerar bx, onde irá ser o multiplicando da conta, além de pedir um caracter
        XOR BX,BX 
        PEDIR_CHAR
    ;caso o caracter seja ESC, pula para o final do PROC
        CMP AL,1Bh
        JE FIM1

        MEIO:
    ;caso o caracter seja abaixo de 0, irá pular para NO_DIGIT, o que significa que o PROC não aceita abaixo de 30h
            CMP AL,30h
            JNGE NO_DIGIT
    ;caso o caracter seja acima de 9, irá pular para NO_DIGIT, que significa que o PROC não aceita acima de 39h
            CMP AL,39h
            JNLE NO_DIGIT
    ;trasforma o caracter em número e salva AX, pois este registrador será usada para a multiplicação
            AND AX,000Fh
            PUSH AX
    ;BX irá receber o valor de AX e multiplicará por 10 (na segunda vez), e soma o produto com o valor de AX
            MOV AX,10
            MUL BX
            POP BX
            ADD BX,AX
    ;pede o próximo caracter
            MOV AH,1
            INT 21h
    ;caso não seja ENTER, voltará para o MEIO do programa
            CMP AL,0Dh
            JNE MEIO
    ;caso o número decimal escolhido seja maior que 20, pulará para NO_DIGIT, significando que não aceita acima de 20
            CMP BX,14h
            JNLE NO_DIGIT
            JMP FIM1

    NO_DIGIT:
    ;caso o programa não aceite os números, imprimirá a mensagem IMPRIMIR_INVALID e pulará um linha, voltando para o começo do PROC
        IMPRIMIR INVALID
        PULAR_LINHA

        JMP INICIO

    FIM1:
    ;retorna para onde o PROC foi chamado
        RET

DECIMAL ENDP

DEFINIR_MAPA PROC
    ;verifica se o número escolhido no RANDOM é 1, caso não, pula para DOIS. Caso seja, chama o PROC MAPA_1, a qual irá 
    ;escrever o MAPA1 no MAPA_PC. Após o processo, irá pular para RETORNO.
    CMP AL,1
    JNE DOIS
    CALL MAPA_1
    JMP RETORNO

    DOIS:
    ;verifica se o RANDOM é 2, caso não, pula para TRES. Caso seja, chama DOIS e escrve em MAPA_PC, MAPA2. Pula para RETORNO após tudo.
        CMP AL,2
        JNE TRES
        CALL MAPA_2
        JMP RETORNO

    TRES:
    ;verifica se o RANDOM é 3. Caso não, pula para QUATRO. Caso seja chama TRES e escreve em MAPA_PC, MAPA3. Pula RETORNO.
        CMP AL,3
        JNE QUATRO
        CALL MAPA_3
        JMP RETORNO

    QUATRO:
    ;verifia RANDOM é 4, Caso não, pula para CINCO. Caso seja, chama QUATRO e escreve em MAPA_PC, MAPA4. Pula RETORNO.
        CMP AL,4
        JNE CINCO
        CALL MAPA_4
        JMP RETORNO
    
    CINCO:
    ;como há apenas cinco mapas, o último não precisa de verificação e chama CINCO, e escreve em MAPA_PC, MAPA5.
        CALL MAPA_5

    RETORNO:
    ;retorna para onde foi chamado
        RET

DEFINIR_MAPA ENDP

MAPA_1 PROC
    ;zera BX, onde será o local da linha, e CX, onde será a contagem. DI como contagem de linhas.
    ZERAR BX CX
    MOV DI,14h

    CHANGE1:
    ;zera SI, onde será o local da coluna, e estabelece a contagem de 20, sendo ele a quantidade de colunas
        DEFINIR_CX

        WRITE1:
    ;manda o conteúdo da posição de MAPA1, BX, SI e guarda em AX, para então mandar para MAPA_PC na mesmo posição
            MOV AX,WORD PTR MAPA1[BX][SI]
            MOV WORD PTR MAPA_PC[BX][SI],AX
    ;adiciona 2 SI, por ser tamanho WORD, sendo 2 BYTES e então recomeça WRITE diminuindo CX
            ADD SI,2
            LOOP WRITE1
    ;adiciona um linha em BX, que seria 40, por ser 20 colunas e tamanho WORD e decrementa DI
        ADICIONAR_BX
        JNZ CHANGE1

    RET

MAPA_1 ENDP

MAPA_2 PROC
    ;zera BX, onde será o local da linha, e CX, onde será a contagem. DI como contagem de linhas.
    ZERAR BX CX
    MOV DI,14h

    CHANGE2:
    ;zera SI, onde será o local da coluna, e estabelece a contagem de 20, sendo ele a quantidade de colunas
        DEFINIR_CX

        WRITE2:
    ;manda o conteúdo da posição de MAPA2, BX, SI e guarda em AX, para então mandar para MAPA_PC na mesmo posição
            MOV AX,WORD PTR MAPA2[BX][SI]
            MOV WORD PTR MAPA_PC[BX][SI],AX
    ;adiciona 2 SI, por ser tamanho WORD, sendo 2 BYTES e então recomeça WRITE diminuindo CX
            ADD SI,2
            LOOP WRITE2
    ;adiciona um linha em BX, que seria 40, por ser 20 colunas e tamanho WORD e decrementa DI
        ADICIONAR_BX
        JNZ CHANGE2
    ;retorna para onde foi chamado
    RET

MAPA_2 ENDP

MAPA_3 PROC
    ;zera BX, onde será o local da linha, e CX, onde será a contagem. DI como contagem de linhas.
    ZERAR BX CX
    MOV DI,14h

    CHANGE3:
    ;zera SI, onde será o local da coluna, e estabelece a contagem de 20, sendo ele a quantidade de colunas
        DEFINIR_CX

        WRITE3:
    ;manda o conteúdo da posição de MAPA3, BX, SI e guarda em AX, para então mandar para MAPA_PC na mesmo posição
            MOV AX,WORD PTR MAPA3[BX][SI]
            MOV WORD PTR MAPA_PC[BX][SI],AX
    ;adiciona 2 SI, por ser tamanho WORD, sendo 2 BYTES e então recomeça WRITE diminuindo CX
            ADD SI,2
            LOOP WRITE3
    ;adiciona um linha em BX, que seria 40, por ser 20 colunas e tamanho WORD e decrementa DI
        ADICIONAR_BX
        JNZ CHANGE3
    ;retorna para onde foi chamado
    RET

MAPA_3 ENDP

MAPA_4 PROC
    ;zera BX, onde será o local da linha, e CX, onde será a contagem. DI como contagem de linhas.
    ZERAR BX CX
    MOV DI,14h

    CHANGE4:
    ;zera SI, onde será o local da coluna, e estabelece a contagem de 20, sendo ele a quantidade de colunas
        DEFINIR_CX

        WRITE4:
    ;manda o conteúdo da posição de MAPA4, BX, SI e guarda em AX, para então mandar para MAPA_PC na mesmo posição
            MOV AX,WORD PTR MAPA4[BX][SI]
            MOV WORD PTR MAPA_PC[BX][SI],AX
    ;adiciona 2 SI, por ser tamanho WORD, sendo 2 BYTES e então recomeça WRITE diminuindo CX
            ADD SI,2
            LOOP WRITE4
    ;adiciona um linha em BX, que seria 40, por ser 20 colunas e tamanho WORD e decrementa DI
        ADICIONAR_BX
        JNZ CHANGE4
    ;retorna para onde foi chamado
    RET

MAPA_4 ENDP

MAPA_5 PROC
    ;zera BX, onde será o local da linha, e CX, onde será a contagem. DI como contagem de linhas.
    ZERAR BX CX
    MOV DI,14h

    CHANGE5:
    ;zera SI, onde será o local da coluna, e estabelece a contagem de 20, sendo ele a quantidade de colunas
        DEFINIR_CX

        WRITE5:
    ;manda o conteúdo da posição de MAPA5, BX, SI e guarda em AX, para então mandar para MAPA_PC na mesmo posição
            MOV AX,WORD PTR MAPA5[BX][SI]
            MOV WORD PTR MAPA_PC[BX][SI],AX
    ;adiciona 2 SI, por ser tamanho WORD, sendo 2 BYTES e então recomeça WRITE diminuindo CX
            ADD SI,2
            LOOP WRITE5
    ;adiciona um linha em BX, que seria 40, por ser 20 colunas e tamanho WORD e decrementa DI
        ADICIONAR_BX
        JNZ CHANGE5
    ;retorna para onde foi chamado
    RET

MAPA_5 ENDP

IMPRIMIR_MAPA PROC
    ;zera BX, onde será o local da linha, e CX, onde será a contagem. DI como contagem de linhas. 
    ;Instrução de impressão de caracter na tela.
    ZERAR BX CX
    MOV AH,2
    MOV DI,14h
    IMPRESSAO:
    ;zerar SI, onde será o local da coluna e estabelecer a contagem em 20, em CX
        DEFINIR_CX

        PASSAR:
    ;mover o conteúdo do MAPA da posição BX SI em DX, transforma o número em caracter, e assim imprimir na tela
            MOV DX,MAPA[BX][SI]
            OR DX,30h
            INT 21h
    ;adiciona 2 SI, por ser tamanho WORD, sendo 2 BYTES e então recomeça WRITE diminuindo CX
            ADD SI,2
            LOOP PASSAR
    ;pula lnha para parecer uma matriz, adiciona um linha em BX, que seria 40, por ser 20 colunas e tamanho WORD e decrementa DI
        PULAR_LINHA
        ADICIONAR_BX
        JNZ IMPRESSAO
    ;retorna para onde foi chamado
    RET

IMPRIMIR_MAPA ENDP

RANDOM PROC
    ;zera DX, onde irá receber o resto da divisão
    XOR DX,DX
    ;traz para os registradores de propósito geral o horário que está no computador do usuário
    MOV AH,2Ch
    INT 21h
    ;zera AX, onde irá receber os segundos, guardados em DH, portanto zerar DL
    ZERAR AX DL
    MOV AL,DH
    ;BX como divisor, recebe 10, assim dividindo o valor de AX por 10.
    MOV BX,0Ah
    XOR DX,DX
    DIV BX
    ;soma o valor do quociente com o resto
    ADD AX,DX
    ;faz mais uma divisão, porém será por 2, assim o resultado em AX será o número do MAPA a ser utilizado
    XOR DX,DX
    MOV BX,2
    DIV BX
    ;caso o valor final seja 0, automaticamente o valor virará 1.
    CMP AL,0
    JNE ADICIONAR
    JMP RETORNAR

    ADICIONAR:

        ADD AL,1

    RETORNAR:
    ;retorna para onde foi chamado
        RET

RANDOM ENDP

LIMPAR_TELA PROC
    ;para não perder o valor do contador, salva CX na pilha e recebe 32
    PUSH CX
    OR CX,20h

    PULAR:
    ;irá pular 32 linhas
        PULAR_LINHA
        LOOP PULAR
    ;recebe de volta o valor do contador
    POP CX
    ;retorna para onde foi chamado
    RET

LIMPAR_TELA ENDP

POSICAO PROC
    ;como a matriz começa no 0, a linha real recebe o valor decrementado
    DEC BX
    ;multiplica o valor de BX por 40, o que é verificar qual linha o usuário esta querendo e então BX recebe o valor do produto
    MOV AX,28h
    MUL BX
    MOV BX,AX
    ;como a matriz começa no 0, a coluna real recebe o valor decrementado
    DEC SI
    ;multiplica o valor de SI por 2, o que é verificar qual coluna o usuário esta querendo e então SI recebe o valor do produto
    MOV AX,2
    MUL SI
    MOV SI,AX
    ;retorna para onde foi chamado
    RET

POSICAO ENDP

MENSAGEM_REPETIDA PROC
    ;limpa a tela e imprime as mensagens REPETIR e ENTRADA e pede um caracter para pausar o programa
    CALL LIMPAR_TELA
    IMPRIMIR REPETIR
    IMPRIMIR ENTRADA
    PEDIR_CHAR
    CALL LIMPAR_TELA
    ;retorna para onde foi chamado
    RET

MENSAGEM_REPETIDA ENDP
END MAIN