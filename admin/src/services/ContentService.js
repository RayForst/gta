import Api from "@/services/Api";

export default {
  meta: {
    get: credentials => Api().get("content/meta", { params: credentials }),
    save: credentials => Api().post("content/meta", credentials)
  },
  head: {
    get: credentials => Api().get("content/head", { params: credentials }),
    save: credentials => Api().post("content/head", credentials)
  },
  blockInfo: {
    get: credentials =>
      Api().get("content/block-info", { params: credentials }),
    save: credentials => Api().post("content/block-info", credentials)
  },
  whyUs: {
    get: credentials => Api().get("content/why-us", { params: credentials }),
    save: credentials => Api().post("content/why-us", credentials)
  },
  work: {
    get: credentials => Api().get("content/work", { params: credentials }),
    save: credentials => Api().post("content/work", credentials)
  },
  customerReview: {
    get: credentials =>
      Api().get("content/customer-review", { params: credentials }),
    save: credentials => Api().post("content/customer-review", credentials)
  },
  aboutCompany: {
    get: credentials =>
      Api().get("content/about-company", { params: credentials }),
    save: credentials => Api().post("content/about-company", credentials)
  },
  about: {
    get: credentials => Api().get("content/about", { params: credentials }),
    save: credentials => Api().post("content/about", credentials)
  },
  team: {
    get: credentials => Api().get("content/team", { params: credentials }),
    save: credentials => Api().post("content/team", credentials)
  },
  whatWeDo: {
    get: credentials =>
      Api().get("content/what-we-do", { params: credentials }),
    save: credentials => Api().post("content/what-we-do", credentials)
  }
};
