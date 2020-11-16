#define	NET_PROTO_IPV4			/* IPv4 protocol */
#define NET_PROTO_IPV6			/* IPv6 protocol */
#undef	NET_PROTO_FCOE			/* Fibre Channel over Ethernet protocol */
#undef	NET_PROTO_STP			/* Spanning Tree protocol */
#undef	NET_PROTO_LACP			/* Link Aggregation control protocol */

#define	DOWNLOAD_PROTO_TFTP		/* Trivial File Transfer Protocol */
#define	DOWNLOAD_PROTO_HTTP		/* Hypertext Transfer Protocol */
#define	DOWNLOAD_PROTO_HTTPS	/* Secure Hypertext Transfer Protocol */
#undef	DOWNLOAD_PROTO_FTP		/* File Transfer Protocol */
#undef	DOWNLOAD_PROTO_SLAM		/* Scalable Local Area Multicast */
#undef	DOWNLOAD_PROTO_NFS		/* Network File System Protocol */
#define DOWNLOAD_PROTO_FILE		/* Local filesystem access */

#undef	SANBOOT_PROTO_ISCSI		/* iSCSI protocol */
#undef	SANBOOT_PROTO_AOE		/* AoE protocol */
#undef	SANBOOT_PROTO_IB_SRP	/* Infiniband SCSI RDMA protocol */
#undef	SANBOOT_PROTO_FCP		/* Fibre Channel protocol */
#undef	SANBOOT_PROTO_HTTP		/* HTTP SAN protocol */

#undef	HTTP_AUTH_BASIC			/* Basic authentication */
#undef	HTTP_AUTH_DIGEST		/* Digest authentication */
#undef	HTTP_AUTH_NTLM			/* NTLM authentication */
#undef	HTTP_ENC_PEERDIST		/* PeerDist content encoding */
#undef	HTTP_HACK_GCE			/* Google Compute Engine hacks */

#undef	CRYPTO_80211_WEP		/* WEP encryption (deprecated and insecure!) */
#undef	CRYPTO_80211_WPA		/* WPA Personal, authenticating with passphrase */
#undef	CRYPTO_80211_WPA2		/* Add support for stronger WPA cryptography */

#define	DNS_RESOLVER			/* DNS resolver */

#undef	VNIC_IPOIB				/* Infiniband IPoIB virtual NICs */
#undef	VNIC_XSIGO				/* Infiniband Xsigo virtual NICs */

// Command Configuration
#define	AUTOBOOT_CMD			/* Automatic booting */
#define	NVO_CMD					/* Non-volatile option storage commands */
#define	CONFIG_CMD				/* Option configuration console */
#define	IFMGMT_CMD				/* Interface management commands */
#undef	IWMGMT_CMD				/* Wireless interface management commands */
#undef IBMGMT_CMD				/* Infiniband management commands */
#undef FCMGMT_CMD				/* Fibre Channel management commands */
#define	ROUTE_CMD				/* Routing table management commands */
#define IMAGE_CMD				/* Image management commands */
#define DHCP_CMD				/* DHCP management commands */
#undef SANBOOT_CMD				/* SAN boot commands */
#define MENU_CMD				/* Menu commands */
#define LOGIN_CMD				/* Login command */
#define SYNC_CMD				/* Sync command */
#define SHELL_CMD				/* Shell command */
#define NSLOOKUP_CMD			/* DNS resolving command */
//#define TIME_CMD				/* Time commands */
//#define DIGEST_CMD			/* Image crypto digest commands */
//#define LOTEST_CMD			/* Loopback testing commands */
#define VLAN_CMD				/* VLAN commands */
//#define PXE_CMD				/* PXE commands */
#define REBOOT_CMD				/* Reboot command */
#define POWEROFF_CMD			/* Power off command */
//#define IMAGE_TRUST_CMD		/* Image trust management commands */
//#define PCI_CMD				/* PCI commands */
//#define PARAM_CMD				/* Form parameter commands */
//#define NEIGHBOUR_CMD			/* Neighbour management commands */
#define PING_CMD				/* Ping command */
//#define CONSOLE_CMD			/* Console command */
//#define IPSTAT_CMD			/* IP statistics commands */
//#define PROFSTAT_CMD			/* Profiling commands */
//#define NTP_CMD				/* NTP commands */
//#define CERT_CMD				/* Certificate management commands */
