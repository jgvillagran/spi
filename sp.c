#include <onion-spi.h>
#include <onion-spi.c>

int main()
{

int ret;
spiParams struct params;
spiParamInit(&params);
printf("Starting: onionSpi module testing...");
printf("Checking if device exists...");
ret = spiCheckDevice();
if(ret==EXIT_SUCCESS){
        printf("Dispostivo Encontrado");
}
else
{
    printf("Dispostivo no Encontrado");
    }

}

