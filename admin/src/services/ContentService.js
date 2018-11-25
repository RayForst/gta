import Api from "@/services/Api";

export default {
  meta: {
    get: credentials => Api().get("content/meta", { params: credentials }),
    save: credentials => Api().post("content/meta", credentials)
  },
  blockInfo: {
    get: credentials => Api().get("content/block-info", { params: credentials }),
    save: credentials => Api().post("content/block-info", credentials)
  },
  whatWeDo: {
    get: credentials =>
      Api().get("content/what-we-do", { params: credentials }),
    save: credentials => Api().post("content/what-we-do", credentials)
  }
};
