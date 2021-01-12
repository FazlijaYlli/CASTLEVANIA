y = posY + sin(pi*(timer*frequency))*amplitude;
timer += 1;
if (timer > 2/frequency) {
    timer = 0;
}
