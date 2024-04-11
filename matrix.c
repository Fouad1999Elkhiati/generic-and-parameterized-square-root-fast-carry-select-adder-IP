#include<stdio.h>
#include<math.h>
#include<stdlib.h>
#include<time.h>

void swap(float *__restrict a, float *__restrict b);
void check_pivot(int pivot, float **__restrict a, float **__restrict b, float *__restrict tb, int n, int swap_cnt);
void ligne_swap(float **__restrict arr, int i, int j, int n);
void matrix_elimination(int pivot, float **__restrict a, float **__restrict b, float *__restrict tb, int n);
void check_pivot_down(int pivot, float **__restrict a, float **__restrict b, float *__restrict tb, int n, int swap_cnt);
float determinant(float **__restrict a,float **__restrict b,float *__restrict tb,int n);
void inversion(float **__restrict a, float **__restrict b, float *__restrict tb, int n);

/*------------------------------------------*/   

void swap(float *__restrict a, float *__restrict b) {
    float temp = *a;
    *a = *b;
    *b = temp;
}

void check_pivot(int pivot, float **__restrict a, float **__restrict b, float *__restrict tb, int n, int swap_cnt){
    int j;
    if(a[pivot][pivot]==0){
        for(j=0;j<n;j++){
            if(a[j][pivot]!=0 && a[pivot][j]!=0){
                ligne_swap(a, pivot, j, n);
                ligne_swap(b, pivot, j, n);
                swap(&tb[pivot], &tb[j]);
                swap_cnt++;
            }
        }
    }
}

void check_pivot_down(int pivot, float **__restrict a, float **__restrict b, float *__restrict tb, int n, int swap_cnt){
    int j;
    if(a[pivot][pivot]==0){
        for(j=pivot+1;j<n;j++){
            if(a[j][pivot]!=0){
                ligne_swap(a, pivot, j, n);
                ligne_swap(b, pivot, j, n);
                swap(&tb[pivot], &tb[j]);
                swap_cnt++;
            }
        }
    }
}

void matrix_elimination(int pivot, float **__restrict a, float **__restrict b, float *__restrict tb, int n){
	int j, k;
	float ratio;
	for(j=pivot+1;j<n;j++){
        ratio=(a[j][pivot]/a[pivot][pivot]);
        for(k=pivot;k<n;k++){
            a[j][k]=a[j][k]-(ratio*a[pivot][k]);      
        }
    	for(k=0;k<n;k++){
			b[j][k]=b[j][k]-(ratio*b[pivot][k]);                                                                                    
        }
        tb[j]=tb[j]-(ratio*tb[pivot]);
    } 
}

void ligne_swap(float **__restrict arr, int i, int j ,int n){
    int k;
    for(k = 0; k < n; k++){
        swap(&arr[i][k] ,&arr[j][k]);
    }
}

float determinant(float **__restrict a,float **__restrict b,float *__restrict tb,int n){
    float det,tmp,ratio;
    det=1;
    int i,j,k,s=0;
    for(i=0;i<n;i++){
        check_pivot(i, a, b, tb, n, s);
    }
    for(i=0;i<n;i++){
        if(a[i][i]==0){
            return (0);          
        }
    }
    for(i=0;i<n-1;i++){
    	check_pivot_down(i, a, b, tb, n, s);
    	if(a[i][i]!=0){
    		matrix_elimination(i, a, b, tb, n);
		}else{
			return 0;
		}
    }    
		 
    for(i=0;i<n;i++){
        det*=a[i][i];
    }             
    det=pow(-1,s)*det;
    printf("\n");      
    return (det);
}
/*------------------------------------------*/     
void inversion(float **__restrict a, float **__restrict b, float *__restrict tb, int n){
    int i,j,k;
	float coeff;
    for(i=n-1;i>=0;--i){
        coeff=a[i][i];
        for(j=n-1;j>i-1;--j){
            a[i][j]=a[i][j]/coeff;
        }
        for(j=n-1;j>=0;--j){
            b[i][j]=b[i][j]/coeff;
        }
        tb[i]=tb[i]/coeff;
        for(k=i-1;k>=0;--k){
        	if(a[k][i]!=0){
                coeff=a[k][i];
            	for(j=n-1;j>k;--j){
                    a[k][j]=a[k][j]-(coeff*a[i][j]);  
                }
                for(j=n-1;j>=0;--j){
                	b[k][j]=b[k][j]-(coeff*b[i][j]);
                }
                tb[k]=tb[k]-(coeff*tb[i]);
            }
        }
    }
}
/*------------------------------------------*/     
int main(void)
{
    int i,j,k,l,N = 110;
    float dt;
    dt = 1;
    clock_t Start, Time;
    
    float **__restrict mat = (float **)malloc(N * sizeof(float *));
    for (int i = 0; i < N; i++) {
        mat[i] = (float *)malloc(N * sizeof(float));
    }
    
	float **__restrict d = (float **)malloc(N * sizeof(float *));
    for (int i = 0; i < N; i++) {
        d[i] = (float *)malloc(N * sizeof(float));
    }
    
	float *__restrict tab = (float *)malloc(N * sizeof(float));
                //float **mat = (float **)malloc(N*N*sizeof(float *));
                //float **d = (float **)malloc(N*N*sizeof(float *));
                //float *tab = (float *)malloc(N*sizeof(float *));;
    printf("Introduisez les coefficients de la matrice : \n");
    for(i=0;i<N;i++){
        for(j=0;j<N;j++){
            mat[i][j] = (float) rand()/rand();
        } 
     }
    printf("------------------------- \n");
    for(i=0;i<N;i++){
        for(j=0;j<N;j++){
            printf("%f \t", mat[i][j]);
        } 
        printf("\n");
    }
    for(i=0;i<N;i++){
        for(j=0;j<N;j++){
            if(i==j){
                d[i][j] = 1;
            }else{
                d[i][j] = 0;
            }
        }
    }
    fflush(stdin);
    printf("\n");
    printf("entrer les coefficients de vecteur b :\n");
    for(i=0;i<N;i++){
        tab[i] = (float) rand()/rand();
    }
    for(j=0;j<N;j++){
        printf("x%d = %f \t", j,tab[j]);
    }
    Start = clock();
    dt=determinant(mat,d,tab,N);
    printf("le determinant de matrice est: %f", dt);
    printf("\n");
    if(dt==0){
        printf("la matrice n'est pas inversible");
        Time = (clock() - Start);
    }else{
        printf("l'inverse de la matrice c'est la matrice:\n");
        inversion(mat,d,tab,N);
        Time = (clock() - Start);
        printf("------------------------- \n");
        for(i=0;i<N;i++){
            for(j=0;j<N;j++){
                printf("%f \t", d[i][j]);
            } 
            printf("\n");
        }
        printf("\n");
        printf("les solutions de systeme lineaire sont :\n");
        for(j=0;j<N;j++){
            printf("x%d = %f \t", j,tab[j]);
        }
    }
    printf("\n execution time is :%d ms", Time);           
    free(mat);
    free(d);
    free(tab);
    return 0;
} 
