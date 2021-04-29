#include <onion-spi.h>
#include <onion-spi.c>

int main()
{

int ret;
spiParams test;
spiParamInit(&test);
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
printf("Registering the device...");
ret=spiRegisterDevice();
printf("Initializing the device parameters...");
ret=spiSetupDevice();


}

