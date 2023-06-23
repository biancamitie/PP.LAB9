#include <stdio.h>
#include <stdlib.h>

int main(){
    int *p;
    int i, N = 5;

    p = (int *) malloc(N*sizeof(int));

    for (i = 0; i < N; i++)
    {
        printf("vet[%d]: ", i);
        scanf("%d", (p+i));
    }
    
    printf("\n");
    for (i = 0; i < N; i++)
    {
        printf("%3d", *(p+i));
    }
    
    free(p);
    return 0;
}

#include <stdio.h>
#include <stdlib.h>

int main(){
    int *p, i, N;

    printf("tamanho vetor: ");
    scanf("%d", &N);


    p = (int *) malloc(N*sizeof(int));

    for (i = 0; i < N; i++)
    {
        printf("valor para vet[%d]: ", i);
        scanf("%d", (p+i));
    }
    
    printf("Vetor digitado:\n");
    for (i = 0; i < N; i++)
    {
        printf("%5d", *(p+i));
    }

    free(p);
    return 0;
}


#include <stdio.h>
#include <stdlib.h>

void num(int *v, int N, int *pares, int *impares){
    int i;

    for (i = 0; i < N; i++)
    {
        printf("vet[%d]: ", i);
        scanf("%d", (v+i));
    }

    for (i = 0; i < N; i++)
    {
        if (*(v+i) % 2 == 0)
        {
            *pares += 1;
        }
        if (*(v+i) % 2 != 0)
        {
            *impares += 1;
        }
    }
}

int main(){
    int *p;
    int N, quant_pares = 0, quant_impares = 0;

    printf("tamanho desse vetor: \n");
    scanf("%d", &N);

    p = (int *) malloc(N*(sizeof(int)));

    num(p, N, &quant_pares, &quant_impares);
    printf("pares nesse vetor:%d\n", quant_pares);
    printf("impares nesse vetor:%d\n", quant_impares);

    free(p);
    return 0;
}

#include <stdio.h>
#include <stdlib.h>

void Tira_vogais(char *v, int tam){
    int i, j;
    for (i = 0; i < tam; i++)
    {
        if (*(v+i) >= 65 && *(v+i) <= 90)
        {
            *(v+i) += 42; 
    }
    
    for (i = 0; *(v+i) != '\0'; i++)
    {
        if (*(v+i) == 'a' || *(v+i) == 'e' || *(v+i) == 'i' || *(v+i) == 'o' || *(v+i) == 'u'){
            for (j = i; *(v+j) != '\0'; j++)
            {
                *(v+j) = *(v+j+1);
            }
            i--;
        }
    }
}

int main(){
    char *p; 
    int tam;

    printf("tamanho da string: ");
    scanf("%d", &tam);
    fflush(stdin);

    p = (char *) malloc(tam*(sizeof(char)));

    printf(" a string: \n");
    fgets(p, tam, stdin);
    
    Tira_vogais(p, tam);
    printf("%s", p);

    free(p);

    return 0;
}

#include <stdio.h>
#include <stdlib.h>

int main(){
    int *p, N, X, i;

    printf("tamanho do vetor: ");
    scanf("%d", &N);

    p = (int *) malloc(N*(sizeof(int)));

    printf("valor para X: ");
    scanf("%d", &X);

    for (i = 0; i < N; i++)
    {
        printf("valor para vet[%d]: ", i);
        scanf("%d", (p+i));
    }
    
    printf("Multiplos %d: \n", X);
    for (i = 0; i < N; i++)
    {
        if (X % *(p+i) == 0)
        {
            printf("%d\n", *(p+i));
        }
        
    }
    
    free(p);
    return 0;
}

#include <stdio.h>
#include <stdlib.h>

void Menu(){
    printf("Escolha opcoes: \n");
    printf("0 - Sair.\n");
    printf("1 -valor em uma posicao.\n");
    printf("2 -valor contido em uma determinada posicao.\n");

}

int main(){
    int tam, *p, i, escolha, posicao, novo_valor;

    do
    {
        printf(" tamanho da memoria: ");
        scanf("%d", &tam);
    } while (tam % sizeof(int) != 0);
    
    p = (int *) malloc(tam*(sizeof(int)));

    for (i = 0; i < tam; i++)
    {
        *(p+i) = 0;
    }

    do
    {
        Menu();
        scanf("%d", &escolha);
        
        if (escolha == 1)
        {
            printf("sera atribuido: ");
            scanf("%d", &novo_valor);
            printf("posicao desse valor: ");
            scanf("%d", &posicao);

            *(p+posicao) = novo_valor;
        }
        else if (escolha == 2)
        {
            printf("posicao que deseja checar: ");
            scanf("%d", &posicao);

            printf("%d", *(p+posicao));
        }
        else if (escolha == 0)
        {
            break;
        }
        else{
            continue;
        }
        
    } while (escolha != 0);
    
    printf("Vetor com modificacoes: ");
    for ( i = 0; i < tam; i++)
    {
        printf("%3d", *(p+i));
    }
    
    free(p);
    return 0;
}

#include <stdio.h>
#include <stdlib.h>

int main(){
    int num_gerados[6], num_bilhete[6], i, count = 0, *num_correto, j, c;

    printf("loteria: \n");
    for (i = 0; i < 6; i++)
    {
        printf("Digite vet[%d]: ", i);
        scanf("%d", &num_gerados[i]);
    }
    
    printf("bilhete: \n");
    for (i = 0; i < 6; i++)
    {
        printf("Digite vet[%d]: ", i);
        scanf("%d", &num_bilhete[i]);
    }

    for (i = 0; i < 6; i++)
    {
        for (j = 0; j < 6; j++)
        {
            if (num_gerados[i] == num_bilhete[j])
            {
                count++;
            }
        }
    }
    
    num_correto = (int *) malloc(count*(sizeof(int)));
    for (i = 0; i < 6; i++)
    {
        for (j = 0; j < 6; j++)
        {
            if (num_gerados[i] == num_bilhete[j])
            {
                for (c = 0; c < count; c++)
                {
                    *(num_correto+c) = num_bilhete[j];
                }
            }
        }
    }

    printf("Numeros da loteria: \n");
    for (i = 0; i < 6; i++)
    {
        printf("%d ", num_gerados[i]);
    }

    printf("\n");
    
    printf("Numeros corretos: \n");
    for (i = 0; i < count; i++)
    {
        printf("%d", *(num_correto+i));
    }
    
    free(num_correto);
    return 0;
}

#include <stdio.h>
#include <stdlib.h>

int main(){
    int *p, i, count = 0;

    p = (int *) calloc(1500,sizeof(int));

    for (i = 0; i < 1500; i++)
    {
        if (*(p+i) == 0)
        {
            count++;
        }
        *(p+i) = i;
    }
    
    printf("0 nesse vetor antes da modificacao: %d\n", count);

    printf("10 primeiros numeros:\n");

    for (i = 0; i < 10; i++)
    {
        printf("%d ", *(p+i));
    }

    printf("\n10 ultimos numeros: \n");

    for (i = 1499; i > 1489; i--)
    {
        printf("%d ", *(p+i));
    }
    
    free(p);
    return 0;
}

#include <stdio.h>
#include <stdlib.h>

int main(){
    int *p, i = 0, num, count = 0;
    p = (int *) malloc(1*sizeof(int));

    for (i = 0;; i++)
    {
        printf("Digite um valor para vet[%d]: ", i);
        scanf("%d", &num);
        if (num >= 0)
        {
            *(p+i) = num;
            count ++;
            p = (int *) realloc(p,(count+1)*(sizeof(int)));
        }
        else{
            break;
        }
    }
    
    printf("Vetor lido: \n");
    for (i = 0; i < count; i++)
    {
        printf("%d ", *(p+i));
    }
    
    free(p);
    return 0;
}

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(){
    double *p;
    int i, tam;

    srand(time(0));

    printf("valores deseja armazenar: \n");
    scanf("%d", &tam);

    p = (double *) malloc(tam*sizeof(double));

    for (i = 0; i < 10; i++)
    {
        *(p+i) = (rand() % (100 - 0 + 1)) + 1;
    }
    
    printf("Vetor preenchido: \n");
    for (i = 0; i < 10; i++)
    {
        printf("%2f ", *(p+i));
    }
    
    free(p);
    return 0;
  }

#include <stdio.h>
#include <stdlib.h>

struct Aluno{
    char sobrenome[20];
    char matricula[20];
    int ano_nasc;
};

typedef struct Aluno Aluno;

int main(){
    int num,i;
    Aluno *p;

    printf("Digite o numero de alunos: ");
    scanf("%d", &num);

    p = (Aluno*)malloc(num*(sizeof(Aluno)));

    for (i = 0; i < num; i++)
    {
        printf("Dados do %d aluno: \n", i+1);
        fflush(stdin);
        printf("Sobrenome: " );
        fgets(p[i].sobrenome, 20, stdin);
        fflush(stdin);
        printf("Matricula: ");
        fgets(p[i].matricula, 20, stdin);
        fflush(stdin);
        printf("Ano de nascimento: ");
        scanf("%d", &p[i].ano_nasc);
        fflush(stdin);
        printf("\n");
    }
    
    printf("Dados dos alunos: \n");
    for (i = 0; i < num; i++)
    {
        printf("Aluno %d: \n", i+1);
        printf("Sobrenome: %s", p[i].sobrenome);
        printf("Matricula: %s", p[i].matricula);
        printf("Ano de nascimento: %d\n", p[i].ano_nasc);
        printf("\n");
    }
    
    free(p);
    return 0;
}

#include <stdio.h>
#include <stdlib.h>

struct produto{
    int cod_id;
    char Nome[50];
    int quant_disp;
    float preco;
};

typedef struct produto produto;

int main(){
    produto *p;
    int num_produtos, i, maior_preco, maior_quant;

    printf("Digite a quantidade de produtos: ");
    scanf("%d", &num_produtos);
    fflush(stdin);

    p = (produto *) malloc(num_produtos*(sizeof(produto)));

    printf("Digite as informacoes do produto: \n");
    for (i = 0; i < num_produtos; i++)
    {
        printf("Produto %d: \n", i+1);
        printf("Codigo de Identificacao: \n");
        scanf("%d", &p[i].cod_id);
        fflush(stdin);
        printf("Nome: \n");
        fgets(p[i].Nome, 50, stdin);
        fflush(stdin);
        printf("Quantidade disponivel: \n");
        scanf("%d", &p[i].quant_disp);
        fflush(stdin);
        printf("Preco de venda: \n");
        scanf("%f", &p[i].preco);
        fflush(stdin);
        printf("\n");
    }
    
    maior_preco = p[0].preco;
    maior_quant = p[0].quant_disp;

    for (i = 1; i < num_produtos; i++)
    {
        if (p[i].preco > maior_preco)
        {
            maior_preco = p[i].preco;
        }
        if (p[i].quant_disp > maior_quant)
        {
            maior_quant = p[i].quant_disp;
        }
    }
    
    for (i = 0; i < num_produtos; i++)
    {
        if (p[i].preco == maior_preco)
        {
            printf("Produto de maior preco: \n");
            printf("ID: %d\n", p[i].cod_id);
            printf("NOME: %s", p[i].Nome);
            printf("QUANTIDADE DISPONIVEL: %d\n", p[i].quant_disp);
            printf("PRECO: %.2f\n", p[i].preco);
            printf("\n");
        }
        if (p[i].quant_disp == maior_quant)
        {
            printf("Produto em maior quantidade: \n");
            printf("ID: %d\n", p[i].cod_id);
            printf("NOME: %s", p[i].Nome);
            printf("QUANTIDADE DISPONIVEL: %d\n", p[i].quant_disp);
            printf("PRECO: %.2f\n", p[i].preco);
            printf("\n");
        }
    }
    
    free(p);
    return 0;
}

#include <stdio.h>
#include <stdlib.h>

int Num_naMatriz(int **mat, int l, int c){
    int i, j, num, verifica = 0;

    printf("Digite um valor: ");
    scanf("%d", &num);

    for (i = 0; i < l; i++)
    {
        for (j = 0; j < c; j++)
        {
            if (mat[i][j] == num)
            {
                verifica = 1;
            }
        }
    }

    if (verifica == 1)
    {
        return 1;
    }
    else{
        return 0;
    }
    
}

int main(){
    int **p, linhas, colunas, i, j, ret_func;

    printf("Digite o num de linhas: ");
    scanf("%d", &linhas);
    printf("Digite o num de colunas: ");
    scanf("%d", &colunas);

    // cria um vetor de linhas 

    if ((p  = (int **) malloc(linhas * (sizeof(int *)))) == NULL)
    {
        printf("ERRO AO ALOCAR MEMORIA!\n");
        exit(1);
    }
     

    // criar colunas para as linhas da matriz

    for (i = 0; i < linhas; i++)
    {
        if ((p[i] = (int *) malloc(colunas * sizeof(int))) == NULL)
        {
            printf("ERRO AO ALOCAR MEMORIA!\n");
            exit(1);
        }
        
    }
    
    // le valores para a matriz

    for (i = 0; i < linhas; i++)
    {
        for (j = 0; j < colunas; j++)
        {
            printf("Digite um valor para matriz[%d][%d]: ", i, j);
            scanf("%d", &p[i][j]);
        }
        
    }
    
    ret_func = Num_naMatriz(p, linhas, colunas);

    if (ret_func == 1)
    {
        printf("valor esta na matriz!\n");
    }
    else{
        printf("valor nao esta na matriz!\n");
    }
    
    for (i = 0; i < linhas; i++)
    {
        free(p[i]);
    }
    free(p);
    p = NULL;

    return 0;
}


#include <stdio.h>
#include <stdlib.h>

int main(){
    int **mat, linhas, colunas, i, j;

    printf("Digite o num de linhas: ");
    scanf("%d", &linhas);
    printf("Digite o num de colunas: ");
    scanf("%d", &colunas);

    if ((mat = (int **) malloc(linhas * sizeof(int *))) == NULL)
    {
        printf("ERRO AO ALOCAR MEMORIA!");
        exit(1);
    }
    
    for (i = 0; i < linhas; i++)
    {
        if ((mat[i] = (int *) malloc(colunas * (sizeof(int)))) == NULL)
        {
            printf("ERRO AO ALOCAR MEMORIA!");
            exit(1);
        }   
    }
    
    for (i = 0; i < linhas; i++)
    {
        for (j = 0; j < colunas; j++)
        {
            printf("Digite um valor para mat[%d][%d]: ", i, j);
            scanf("%d", &mat[i][j]);
        }
    }

    for (i = 0; i < linhas; i++)
    {
        for (j = 0; j < colunas; j++)
        {
            printf("%d ", mat[i][j]);
        }
        printf("\n");
    }
    
    for (i = 0; i < linhas; i++)
    {
        free(mat[i]); 
    }
    free(mat);
    mat = NULL;

    return 0;
}


#include <stdio.h>
#include <stdlib.h>

void Organiza_Num(int **p, int linhas, int colunas, int *v_func){
    int i, j, k = 0, aux;

    for (i = 0; i < linhas; i++)
    {
        for (j = 0; j < colunas; j++)
        {
            v_func[k] = p[i][j];
            k++;
        }
    }
    
    for (i = 0; i < k; i++)
    {
        for (j = i+1; j < k; j++)
        {
            if (*(v_func+i) < *(v_func+j))
            {
                aux = *(v_func+i);
                *(v_func+i) = *(v_func+j);
                *(v_func+j) = aux; 
            }
        }   
    } 
}

int main(){
    int **mat, N, M, i, j, *v, c;

    printf("Digite o num de linhas: ");
    scanf("%d", &N);
    printf("Digite o num de colunas: ");
    scanf("%d", &M);

    if ((v = (int *) malloc((N*M)*(sizeof(int)))) == NULL) 
    {
        printf("ERRO AO ALOCAR MEMORIA!");
        exit(1);
    }
    
    if ((mat = (int **) malloc(N * sizeof(int *))) == NULL)
    {
        printf("ERRO AO ALOCAR MEMORIA!");
        exit(1);
    }
    
    for (i = 0; i < N; i++)
    {
        if ((mat[i] = (int *) malloc(M * (sizeof(int)))) == NULL)
        {
            printf("ERRO AO ALOCAR MEMORIA!");
            exit(1);
        }   
    }

    for (i = 0; i < N; i++)
    {
        for (j = 0; j < M; j++)
        {
            printf("Digite um valor para mat[%d][%d]: ", i, j);
            scanf("%d", &mat[i][j]);
        }
    }

    Organiza_Num(mat, N, M, v);

    for (i = 0; i < N*M; i++)
    {
        printf("%d \n", v[i]);
    }
    

    printf("Tres maiores numeros dessa matriz: \n");
    for (i = 0; i < N; i++)
    {
        for (j = 0; j < M; j++)
        {
            for (c = 0; c < 3; c++)
            {
                if (mat[i][j] == *(v+c))
                {
                    printf("%d -> Na posicao linha:%d coluna:%d\n", mat[i][j], i, j);

                }
            }
        }
    }
    
    for (i = 0; i < N; i++)
    {
        free(mat[i]); 
    }
    free(mat);

    return 0;
}

#include <stdio.h>
#include <stdlib.h>

int main(){
    int **mat, **mat_transposta, N, M, i, j;

    printf("Digite um valor para as linhas: ");
    scanf("%d", &N);
    printf("Digite um valor para as colunas: ");
    scanf("%d", &M);

    // matriz
    if ((mat = (int **) malloc(N*sizeof(int *))) == NULL)
    {
        printf("ERRO AO ALOCAR MEMORIA!\n");
        exit(0);
    }
    
    for (i = 0; i < N; i++)
    {
        if ((mat[i] = (int *) malloc(M*sizeof(int))) == NULL)
        {
            printf("ERRO AO ALOCAR MEMORIA!\n");
            exit(0);
        }
    }
    
    for (i = 0; i < N; i++)
    {
        for (j = 0; j < M; j++)
        {
            printf("Digite um valor para mat[%d][%d]: ", i, j);
            scanf("%d", &mat[i][j]);
        }
    }

    printf("MATRIZ: \n");
    for (i = 0; i < N; i++)
    {
        for (j = 0; j < M; j++)
        {
            printf("%2d ", mat[i][j]);
        }
        printf("\n");
    }
    

    // matriz tranposta

    if ((mat_transposta = (int **) malloc(M*sizeof(int *))) == NULL)
    {
        printf("ERRO AO ALOCAR MEMORIA!\n");
        exit(0);
    }
    
    for (i = 0; i < M; i++)
    {
        if ((mat_transposta[i] = (int *) malloc(N*sizeof(int))) == NULL)
        {
            printf("ERRO AO ALOCAR MEMORIA!\n");
            exit(0);
        }
    }
    
    for (i = 0; i < M; i++)
    {
        for (j = 0; j < N; j++)
        {
            mat_transposta[i][j] = mat[j][i];
        }
    }
    
    printf("MATRIZ TRANSPOSTA: \n");
    for ( i = 0; i < M; i++)
    {
        for (j = 0; j < N; j++)
        {
            printf("%2d ", mat_transposta[i][j]);
        }
        printf("\n");
    }
    
    return 0;
}

#include <stdio.h>
#include <stdlib.h>

int main(){
    int *vet, n = 10, *vet2, num, i, count = 0;

    vet = (int *) malloc(n*sizeof(int));

    while(1){
        printf("Digite um numero para inserir no vetor, se deseja sair digite 0: ");
        scanf("%d", &num);

        if (num == 0){
            break;
        }
  
        vet[count] = num;
        count++;

        if (count == n)
        {
            vet2 = (int *) malloc((n+10)*sizeof(int)); 

            for (i = 0; i < n; i++)
            {
                vet2[i] = vet[i]; 
            }
            free(vet);
            n+=10; 
            vet = vet2; 
        }
    }

    printf("Vetor: \n");
    for (i = 0; i < count; i++)
    {
        printf("%d ", vet[i]);
    }

    free(vet);
    
    return 0;
}

#include <stdio.h>
#include <stdlib.h>

struct produto{
    char nome[30];
    int codigo;
    float preco;
};

typedef struct produto produto;

int main(){
    int *vet, **mat, i;
    char **text;
    produto *s;

    vet = (int *) calloc(256, sizeof(int));

    s = (produto*) malloc(50 * sizeof(produto));
    if((mat = (int **) malloc(10 * sizeof(int *)) == NULL)){
        printf("ERRO AO ALOCAR MEMORIA!\n");
        exit(1);
    }

    for (i = 0; i < 10; i++){
        if((mat[i] = (int *) malloc(10 * sizeof(int)) == NULL)){
        printf("ERRO AO ALOCAR MEMORIA!\n");
        exit(1);
        }
    }
  
    if ((text = (char **) malloc(100 * sizeof(char *))) == NULL)
    {
        printf("ERRO AO ALOCAR MEMORIA!\n");
        exit(1);
    }

    for (i = 0; i < 100; i++){
        if((text[i] = (char *) malloc(80 * sizeof(char)) == NULL)){
        printf("ERRO AO ALOCAR MEMORIA!\n");
        exit(1);
        }
    }

    // limpar memoria    
    for ( i = 0; i < 10; i++)
    {
        free(mat[i]);
    }
    free (mat);
    mat = NULL;

    for ( i = 0; i < 100; i++)
    {
        free(text[i]);
    }
    free (text);
    text = NULL;

    free(vet);
    free(s);
    return 0;
}


#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void opcao(char **m, char escolha, int linhas, int colunas){
    int i, j, l;
    char s[31];

    if (escolha == 'a')    
    {
        printf("Digite a linha onde deseja guardar o nome: ");
        scanf("%d", &l);
        fflush(stdin);
        printf("Digite o nome que deseja guardar: \n");
        fgets(m[l], colunas + 1, stdin);
        fflush(stdin);
    }
    else if (escolha == 'b')
    {
        printf("Digite a posicao onde deseja apagar o nome: ");
        scanf("%d", &l);
        fflush(stdin);   

        for (i = l; i < linhas; i++)
        {
            for (j = 0; j < colunas; j++)
            {
                m[i][j] = ' ';
            }
        }
    }
    else if (escolha == 'c')
    {
        printf("Digite um nome que deseja procurar: ");
        fgets(s, 31, stdin);
        fflush(stdin);

        for (i = 0; i < linhas; i++)
        {
            if (strcmp(m[i], s) == '\0')
            {
                printf("Digite o novo nome a inserir: ");
                fgets(m[i], colunas + 1, stdin);
                fflush(stdin);
            }
        }
    }
    else if (escolha == 'd')
    {
        printf("Digite um nome que deseja apagar: ");
        fgets(s, colunas, stdin);
        fflush(stdin);

        for (i = 0; i < linhas; i++)
        {
            if (strcmp(m[i], s) == '\0')
            {
                m[i][0] = '\0';
            }
        }
    }
    else if (escolha == 'e')
    {
        printf("Qual linha do nome que deseja recuperar? \n");
        scanf("%d", &l);

        printf("%s", m[l]);
    }
}

int main(){
    char **nomes, escolha;
    int num, i;

    printf("Digite a quantidade de nomes: \n");
    scanf("%d", &num);

    if ((nomes = (char **) malloc(num * sizeof(char *))) == NULL)
    {
        printf("ERRO AO ALOCAR MEMORIA!\n");
        exit(1);
    }

    for (i = 0; i < num; i++)
    {
        if ((nomes[i] = (char *) malloc(31 * sizeof(char))) == NULL)
        {
            printf("ERRO AO ALOCAR MEMORIA!\n");
            exit(1);
        }
    }
    
    do
    {
        printf("a) Gravar um nome em uma linha da matriz\n");
        printf("b) Apagar o nome contido em uma linha da matriz\n");
        printf("c) Informar um nome, procurar a linha onde ele se encontra e substituir por outro nome\n");
        printf("d) Informar um nome, procurar a linha onde ele se encontra e apagar\n");
        printf("e) Pedir para recuperar o nome contido em uma linha da matriz.\n");
        printf("f) Sair\n");

        printf("Digite sua escolha: \n");
        scanf(" %c", &escolha);
        fflush(stdin);

        if (escolha == 'a' || escolha == 'b' || escolha == 'c' || escolha == 'd' || escolha == 'e')
        {
            opcao(nomes, escolha, num, 31);
        }
        else if (escolha == 'f')
        {
            break;
        }
        else
        {
            printf("Digite uma escolha valida!");
        }
    } while (escolha != 'f');
         
    for (i = 0; i < num; i++)
    {
        free(nomes[i]);
    }
    free(nomes);
    nomes = NULL;

    return 0;
}


#include <stdio.h>
#include <stdlib.h>
#include <math.h>

struct cidade{
    char nome[30];
    float x;
    float y;
};

typedef struct cidade cidade;

int main (){
    cidade *c; 
    int N, i, cid1, cid2, j;
    float **mat;

    printf("Digite o numero de cidades: ");
    scanf("%d", &N);
    fflush(stdin);

    c = (cidade *) malloc(N*sizeof(cidade));

    if ((mat = (float **) malloc(N * sizeof(float *))) == NULL)
    {
        printf("ERRO AO ALOCAR MEMORIA!");
        exit(1);
    }
    
    for (i = 0; i < N; i++)
    {
        if ((mat[i] = (float *) malloc(N * sizeof(float))) == NULL)
        {
            printf("ERRO AO ALOCAR MEMORIA!");
            exit(1);
        }
    }

    for (i = 0; i < N; i++)
    {
        printf("Digite o nome da cidade %d:", i+1);
        fgets(c[i].nome, 30, stdin);
        fflush(stdin);
        printf("Digite a coordenada X: ");
        scanf("%f", &c[i].x);
        fflush(stdin);
        printf("Digite a coordenada Y: ");
        scanf("%f", &c[i].y);
        fflush(stdin);
        printf("\n");
    }
    
    for (i = 0; i < N; i++)
    {
        for (j = 0; j < N; j++)
        {
            mat[i][j] = sqrt(pow(c[i].x - c[j].x,2) + pow(c[i].y - c[j].y,2));
        }
    }
    
    printf("Distancia entre as cidades:\n");
    for (i = 0; i < N; i++)
    {
        for (j = 0; j < N; j++)
        {
           printf("%.2f ", mat[i][j]);
        }
        printf("\n");
    }
    
    printf("Digite duas cidades que deseja saber a distancia entre elas:");
    scanf("%d %d", &cid1, &cid2);
    printf("%.2f", mat[cid1][cid2]);

    for (i = 0; i < N; i++)
    {
        free(mat[i]);
    }
    free (mat);
    mat = NULL;

    return 0;
}

#include <stdio.h>
#include <stdlib.h>

void preenche_matriz(int **m, int linha, int coluna){
    int i, j;
    for (i = 0; i < linha; i++)
    {
        for (j = 0; j < coluna; j++)
        {
            printf("Digite um valor para mat[%d][%d]: ", i, j);
            scanf("%d", &m[i][j]);
        }
    }
}

int main(){
    int **mat1, **mat2, **mat_prod, i, j, a, b, c, d, soma = 0, k, prod;

    // matriz 1
    printf("Digite um valor para as linhas da matriz 1: ");
    scanf("%d", &a);
    printf("Digite um valor para as colunas da matriz 1: ");
    scanf("%d", &b);

    if ((mat1 = (int **) malloc(a*sizeof(int *))) == NULL)
    {
        printf("ERRO AO ALOCAR MEMORIA!\n");
        exit(1);
    }
    
    for (i = 0; i < a; i++)
    {
        if ((mat1[i] = (int *) malloc(b*sizeof(int))) == NULL)
        {
            printf("ERRO AO ALOCAR MEMORIA!\n");
            exit(1);
        }
    }
    
    printf("\nMatriz 1: \n");
    preenche_matriz(mat1, a, b);
    
    for (i = 0; i < a; i++)
    {
        for (j = 0; j < b; j++)
        {
            printf("%d ", mat1[i][j]);
        }
        printf("\n");
    }
    
    // matriz 2;

    printf("Digite um valor para as linhas da matriz 2: ");
    scanf("%d", &c);
    printf("Digite um valor para as colunas da matriz 2: ");
    scanf("%d", &d);

    if ((mat2 = (int **) malloc(c*sizeof(int *))) == NULL)
    {
        printf("ERRO AO ALOCAR MEMORIA!\n");
        exit(1);
    }
    
    for (i = 0; i < a; i++)
    {
        if ((mat2[i] = (int *) malloc(d*sizeof(int))) == NULL)
        {
            printf("ERRO AO ALOCAR MEMORIA!\n");
            exit(1);
        }
    }

    printf("\nMATRIZ 2: \n");
    preenche_matriz(mat2, c, d);

    for (i = 0; i < c; i++)
    {
        for (j = 0; j < d; j++)
        {
            printf("%d ", mat2[i][j]);
        }
        printf("\n");
    }

    // matriz produto
    if((mat_prod = (int **) malloc(a*sizeof(int *))) == NULL) {
        printf("ERRO AO ALOCAR MEMORIA!\n");
        exit(1);
    }
    
    for (i = 0; i < a; i++)
    {
        if((mat_prod[i] = (int *) malloc(d*sizeof(int))) == NULL){
            printf("ERRO AO ALOCAR MEMORIA!\n");
            exit(1);
        }
    }

    printf("\nMATRIZ PRODUTO:\n");
    if (b == c)
    {
        // preenche a  matriz   
        for (i = 0; i < a; i++)
        {
            for (j = 0; j < d; j++)
            {
                soma = 0;
                for (k = 0; k < c; k++)
                {
                    prod = mat1[i][k] * mat2[k][j];
                    soma+=prod;
                }
                mat_prod[i][j] = soma;
            }
        }

        printf("MATRIZ PRODUTO: \n");
        for (i = 0; i < a; i++)
        {
            for (j = 0; j < d; j++)
            {
                printf("%d ", mat_prod[i][j]);
            }
            printf("\n");
        }
        
    }
    else{
        printf("Nao da para fazer !\n");
    }
    
    for (i = 0; i < a; i++)
    {
        free(mat_prod[i]); 
        free(mat1[i]);
    }
    for (i = 0; i < c; i++)
    {
        free(mat2[i]); 
    }
    free(mat1);
    free(mat2);
    free(mat_prod);

    return 0;
}
