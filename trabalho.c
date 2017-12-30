/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   main.c
 * Author: Thiago
 *
 * Created on 28 de Dezembro de 2017, 14:43
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>


char* string_substring(char str[], int start, int end);

int main(){
	char form[100], *substring;
	char clausulas[32][32]; // Variável para separação de cláusulas e resolução
                                // Ex: clausulas[0][0-(numero de caracteres da clausula]: {A,B,C}
                                // clausulas[1][0 - ...]: {~A,~B,~C}
                                // compara(como fazer?) clausulas [0][0-...] com clausulas [1][0-...]
                                // resposta na próxima linha: clausulas[2][0-...] : {} CLÁUSULA VAZIA DECORRENTE DA COMPARAÇÃO DAS CLÁUSULAS ANTERIORES
        int i, j, ini, pos=0;
    	FILE *arquivo;
    
    	arquivo = fopen("arquivo.txt", "w");
    
    
    	printf("Insira o conjunto de cláusulas na forma de conjuntos: ");

	gets(form); 
	
	for(i=0;(i+1)<strlen(form);i++){
		ini = i+1;
	
		while(form[i]!='}'){
			i++;
		}
	
		pos = i+1;
	
		substring = string_substring(form,ini,pos); 
	
		//usando fprintf para armazenar a string no arquivo
 	   	fprintf(arquivo, "%s\r\n", substring);
 
		
		//printf("A substring: %s\n", substring);
    	}
    	
	/* Solução através de matriz de caracteres
	
        for(i = 0; i < 32; i++){
            for(j = 0; j < 32; j++){
                // Codigo para ler linha por linha do arquivo e adicionar na matriz de caracteres
                
            }
        }
        
	for(i = 0; i < 32; i++){
            for(j = 0; j < 32; j++){
                printf("%c", clausulas[i][j]);
                //Imprimir caracteres linha por linha
            }
	    printf("\n");
        }
        
	*/
       
    	
	//usando fclose para fechar o arquivo
	fclose(arquivo);

	/*printf("%d",strlen(form));*/

 exit(0);
}

char* string_substring(char str[], int start, int end) {
    int i, j;
    char *sub; 
     
    // Verifica valores incompatíveis e 
    // retorna NULL
    if(start >= end || end > strlen(str)) {
        return NULL;
    }
     
    // Aloca memória para a substring
    sub = (char *) malloc(sizeof(char) * (end - start + 1));
     
    // Copia a substring para a variável
    for(i = start, j = 0; i < end; i++, j++) {
        sub[j] = str[i];
    }
     
     
    return sub;
