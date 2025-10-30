#include "ft9201.h"

struct _FpDeviceFt9201 {
    FpDevice parent;
};

G_DEFINE_TYPE(FpDeviceFt9201, fpi_device_ft9201, FP_TYPE_DEVICE)

static const FpIdEntry id_table[] = {
    { .vid = 0x2808, .pid = 0x9338, .driver_data = 0 },
    { .vid = 0, .pid = 0, .driver_data = 0 },
};

static void fpi_device_ft9201_init(FpDeviceFt9201 *self) {
    /* Inicialización del dispositivo */
}

static void fpi_device_ft9201_class_init(FpDeviceFt9201Class *klass) {
    FpDeviceClass *device_class = FP_DEVICE_CLASS(klass);

    device_class->id = "ft9201";
    device_class->full_name = "FocalTech FT9201 Fingerprint Sensor";
    device_class->type = FP_DEVICE_TYPE_USB;
    device_class->id_table = id_table;
    device_class->scan_type = FP_SCAN_TYPE_PRESS;
    device_class->nr_enroll_stages = 10;
    
    /* Nota: Estas funciones necesitarán ser implementadas */
    // device_class->open = ft9201_open;
    // device_class->close = ft9201_close;
    // device_class->enroll = ft9201_enroll;
    // device_class->verify = ft9201_verify;
    // device_class->identify = ft9201_identify;
}

/* Función de inicialización del driver */
void ft9201_driver_init(void) {
    fp_dbg("Inicializando driver FT9201");
}