import * as k8s from "@pulumi/kubernetes";

const ns = new k8s.core.v1.Namespace("my-namespace", {
    metadata: {
        name: "my-namespace",
    },
});
