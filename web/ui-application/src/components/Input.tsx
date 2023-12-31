import { InputHTMLAttributes, Ref, forwardRef } from "react";

interface InputProps extends InputHTMLAttributes<HTMLInputElement> { }

export default forwardRef(({ className, ...inputProps }: InputProps, ref: Ref<HTMLInputElement>) => {
    return (
        <input className={["px-4 py-2 outline-none border-b focus:border-orange-400 transition-colors", className].join(" ")} {...inputProps} ref={ref} />
    )
})