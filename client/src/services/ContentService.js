import Api from "@/services/Api";

export default {
  meta: {
    get: credentials => Api().get("content/meta", { params: credentials })
  },
  whatWeDo: {
    get: credentials => Api().get("content/what-we-do", { params: credentials })
  },
  blockInfo: {
    get: credentials => Api().get("content/block-info", { params: credentials })
  }
};
