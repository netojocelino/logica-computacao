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
	char form[100], *substring, c;
	char clausulas[32][32]; // Variável para separação de cláusulas e resolução
                                // Ex: clausulas[0][0-(numero de caracteres da clausula]: {A,B,C}
                                // clausulas[1][0 - ...]: {~A,~B,~C}
                                // compara(como fazer?) clausulas [0][0-...] com clausulas [1][0-...]
                                // resposta na próxima linha: clausulas[2][0-...] : {} CLÁUSULA VAZIA DECORRENTE DA COMPARAÇÃO DAS CLÁUSULAS ANTERIORES
        int i, j, l = 0, k,  ini, pos=0;
    	
        
        FILE *arquivo;
        
    	arquivo = fopen("arquivo.txt", "w");
        
        printf("Instruções \n\n"); 
        printf("Caractere maiúsculo significa valor verdade, caractere minúsculo significa valor falsidade. \n\n");
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
 
		
		printf("A substring: %s\n", substring);
    	}
    
        fclose(arquivo);
        
        // Caracteres em ASCII
        // 65-90: Alfabeto maiúsculo
        // 97-122: Alfabeto minúsculo
        // 10: nova linha - Line Feed
        
        arquivo = fopen("arquivo.txt", "r");
        
        for(i = 0; i < 32; i++){
            k = 0;
            
            for(j = 0; j < 32; j++){
                // Codigo para ler linha por linha e adicionar na matriz de caracteres
                c = fgetc(arquivo);
                
                //printf("%c \n", c);
                
                if((c > 64 && c < 91) || (c > 96 && c < 123)){
                    clausulas[l][k] = c ;
                    k = k + 1;
                }else{
                
                    if(c == 10){
                        for ( k ; k < 32; k++)
                            clausulas[l][k] = 30;
                        
                        l = l + 1;
                       
                        break;
                    }else{
                        if(c == -1){
                            
                            for( l ; l < 32; l++){
                                for ( k ; k < 32; k++){
                                    clausulas[l][k] = 30;
                                }
                                
                                k = 0;
                            
                            }
                            
                            break;
                        
                        }
                    }
                    
                }
            }
            
            if(feof(arquivo))
                break;
        
        }
        
	for(i = 0; i < 32; i++){
            for(j = 0; j < 32; j++){
                if((clausulas[i][j] > 64 && clausulas[i][j] < 91) || (clausulas[i][j] > 96 && clausulas[i][j] < 123))
                    printf("%c", clausulas[i][j]);   
            }
            
            if((clausulas[i][j] > 64 && clausulas[i][j] < 91) || (clausulas[i][j] > 96 && clausulas[i][j] < 123))
                    printf("\n");
            
        }
        
        
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
    
}
