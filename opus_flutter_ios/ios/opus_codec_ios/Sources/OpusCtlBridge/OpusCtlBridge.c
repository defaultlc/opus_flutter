#include "OpusCtlBridge.h"

typedef struct OpusEncoder OpusEncoder;
extern int opus_encoder_ctl(OpusEncoder *encoder, int request, ...);

// Apple ARM64 passes variadic arguments differently from fixed arguments.
// opus_codec_dart looks up this fixed-signature symbol through dart:ffi.
__attribute__((visibility("default")))
int opus_encoder_ctl_int(OpusEncoder *encoder, int request, int value) {
  return opus_encoder_ctl(encoder, request, value);
}

// The plugin calls this at registration so static linkers retain the bridge.
static int (*volatile retained_bridge)(OpusEncoder *, int, int);
void opus_ctl_bridge_register(void) {
  retained_bridge = opus_encoder_ctl_int;
}
