import { InputHTMLAttributes, Ref, forwardRef } from "react";

interface SelectProps extends InputHTMLAttributes<HTMLInputElement> {
    options: Array<{
        title: React.ReactNode,
        value: any
    }>
}

export default forwardRef(({ className, ...inputProps }: SelectProps, ref: Ref<HTMLInputElement>) => {
    return (
        <input className={["px-4 py-2 outline-none border-b focus:border-orange-400 transition-colors", className].join(" ")} {...inputProps} ref={ref} />
    )
})