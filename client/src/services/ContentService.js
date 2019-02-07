import Api from "@/services/Api";

export default {
  settings: {
    get: () => Api().get("/settings")
  },
  head: {
    get: credentials => Api().get("content/head", { params: credentials })
  },
  whyUs: {
    get: credentials => Api().get("content/why-us", { params: credentials })
  },
  works: {
    get: credentials => Api().get("content/work", { params: credentials })
  },
  about: {
    get: credentials => Api().get("content/about", { params: credentials })
  },
  team: {
    get: credentials => Api().get("content/team", { params: credentials })
  },
  aboutCompany: {
    get: credentials =>
      Api().get("content/about-company", { params: credentials })
  },
  customerReviews: {
    get: credentials =>
      Api().get("content/customer-review", { params: credentials })
  },
  whatWeDo: {
    get: credentials => Api().get("content/what-we-do", { params: credentials })
  },
  blockInfo: {
    get: credentials => Api().get("content/block-info", { params: credentials })
  },
  contactRequest: {
    save: credentials => Api().post("contacts", credentials)
  },
  gallery: {
    get: credentials => Api().get("gallery", { params: credentials })
  }
};
