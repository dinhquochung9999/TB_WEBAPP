import { createI18n } from "vue-i18n";
import vi from "./vi";
import en from "./en";
import zh from "./zh";

const savedLocale = localStorage.getItem("locale") || "vi";

export const i18n = createI18n({
    legacy: false,
    locale: savedLocale,
    fallbackLocale: "vi",
    messages: {
        vi,
        en,
        zh,
    },
});