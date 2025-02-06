import * as gcp from "@pulumi/gcp";

const cluster = new gcp.container.Cluster("my-cluster" , {
 intialNodeCount : 2,
 nodeVersion: "1.24",
 minMasterVersion: "1.24",
 nodeConfig: {
    machineType: "e2-medium",
    oauthScope: [
        "https://www.googleapis.com/auth/compute",
        "https://www.googleapis.com/auth/devstorage.read_only",
        "https://www.googleapis.com/auth/logging.write",
        "https://www.googleapis.com/auth/monitoring",
      ],
    },
  });

  export const kubeconfig = cluster.masterAuth.apply(auth => ({
    apiVersion: "v1",
    kind: "Config",
    clusters: [{
      name: "my-cluster",
      cluster: {
        server: `https://${cluster.endpoint}`,
        "certificate-authority-data": auth.clusterCaCertificate,
      },
    }],
    contexts: [{
      name: "my-cluster",
      context: {
        cluster: "my-cluster",
        user: "admin",
      },
    }],
    users: [{
      name: "admin",
      user: {
        token: auth.accessToken,
      },
    }],
  }));