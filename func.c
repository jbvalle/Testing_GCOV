
int pot(int base, int exp){

    int val = base;

    for(int i = 0; i < exp - 1; i++){

        val *= base;
    }

    return val;
}
