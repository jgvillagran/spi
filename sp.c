#include <onion-spi.h>
#include <onion-spi.c>

int main()
{
int ret;
spiParamInit();
Starting: onionSpi module testing...");
printf("Checking if device exists...");
ret = spi.checkDevice();
if(ret!=0){ printf("Dispostivo Encontrado");}
else
{printf("Dispostivo no Encontrado");}
printf("Registering the device...");
ret=spi.registerDevice();
printf("Initializing the device parameters...");
ret=spi.setupDevice();


}

