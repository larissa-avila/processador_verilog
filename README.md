# Processador Simples - Verilog
Este repositório contém a implementação de um processador multiciclo simples de 16 bits, desenvolvido em Verilog. O projeto foi feito com fins didáticos, focando em modularidade e clareza de funcionamento dos componentes principais de uma CPU.


## Descrição
O processador é composto por uma arquitetura básica com suporte a operações aritméticas e lógicas simples. Ele segue um modelo simplificado, executando uma instrução a cada 4 ciclos de clock a partir de sinais de controle gerados por uma unidade de controle. Possui 8 registradores de 16 bits, e uma Unidade Lógica Aritmética (ULA) capaz de fazer operações como soma e subtração.


## Arquivos do Projeto
```text
processador
├── counter.v            # contador
├── decode.v             # decodificador de registradores
├── multiplexer.v        # multiplexador
├── register_file.v      # banco de registradores
├── sign_extend.v        # extensor de sinal para valores imediatos na instrução
├── alu.v                # unidade lógica e aritmética
├── control_unit.v       # unidade de controle
├── processor.v          # processador para unir as unidades
├── testbench.v          # teste bench com um programa simples
```

## Conjunto de intruções
- ADD    &nbsp;&nbsp;&nbsp;&nbsp;       #Realiza a adição entre dois registradores
- SUB    &nbsp;&nbsp;&nbsp;&nbsp;       #Realiza a subtração entre dois registradores
- NAN    &nbsp;&nbsp;&nbsp;&nbsp;       #Realiza a operação NAND entre dois registradores
- REP    &nbsp;&nbsp;&nbsp;&nbsp;       #Copia o valor de um regitrador para outro
- LDI    &nbsp;&nbsp;&nbsp;&nbsp;       #Carrega um valor em um registrador
- OUT    &nbsp;&nbsp;&nbsp;&nbsp;       #Coloca o valor de um registrador na barramento de saída

## Requisitos para usar
Icarus Verilog
GtkWave (para visualizar a simulação)

## Como rodar
1. Entre no diretŕoio do processador e compile todos os módulos com o Icarus Verilog:
```bash
iverilog -o output *.v
```
2. Execute a simulação
```bash
vvp output
```
3. Visualize as formas de onda no GTKWave
```bash
gtkwave testbench.vcd
```

##### Desenvolvido por [Larissa Rodrigues de Ávila](https://github.com/larissa-avila)



