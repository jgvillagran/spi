#include <onion-spi.h>
#include <onion-spi.c>

int main()
{

int ret;
spiParams params;
spiParamInit(& params);
printf("Starting: onionSpi module testing...");
printf("Checking if device exists...");
ret = spicheckDevice();
if(ret==EXIT_SUCCESS){
        printf("Dispostivo Encontrado");
}
else
{
    printf("Dispostivo no Encontrado");
    }
}

