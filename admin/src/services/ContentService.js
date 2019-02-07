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
    save: credentials => Api().post("content/why-us", credentials),
    remove: credentials => Api().delete("content/why-us", { params: credentials })
  },
  work: {
    get: credentials => Api().get("content/work", { params: credentials }),
    save: credentials => Api().post("content/work", credentials),
    remove: credentials => Api().delete("content/work", { params: credentials })
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
    save: credentials => Api().post("content/team", credentials),
    remove: credentials => Api().delete("content/team", { params: credentials })
  },
  whatWeDo: {
    get: credentials =>
      Api().get("content/what-we-do", { params: credentials }),
    save: credentials => Api().post("content/what-we-do", credentials),
    remove: credentials => Api().delete("content/what-we-do", { params: credentials })
  },
  upload: {
    save: credentials => Api().post("upload", credentials)
  },
  settings: {
    get: credentials => Api().get("contacts/keys", credentials),
    save: credentials => Api().post("settings", credentials)
  },
  contacts: {
    get: credentials => Api().get("contacts", credentials),
    read: credentials => Api().get("/contacts/read", { params: credentials })
  },
  gallery: {
    save: credentials => Api().post("save-gallery", credentials),
    get: credentials => Api().get("gallery", { params: credentials })
  }
};
