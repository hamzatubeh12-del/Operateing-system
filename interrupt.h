#ifndef __interrupt_h
#define __interrupt_h

class InterruptManager{
    public:
        InterruptManager();
        ~InterruptManager();
    protected:
        static void handleInterrupt(uint8_t interruptNumber, uint32_t esp);
};

#endif // __interrupt_h 