import { InputHTMLAttributes, Ref, forwardRef } from "react";

interface CheckboxProps extends InputHTMLAttributes<HTMLInputElement> {
    label: React.ReactNode
    description: React.ReactNode
    type?: "checkbox"
}

export default forwardRef(({ label, description, className, ...inputProps }: CheckboxProps, ref: Ref<HTMLInputElement>) => {
    return (
        <label className={["flex items-center gap-x-3 px-4 py-2 group", className].join(" ")}>
            <input className="hidden peer" type="checkbox" {...inputProps} ref={ref} />

            <div className="peer-checked:[&>div]:shadow-lg peer-checked:[&>div]:shadow-orange-100 peer-checked:[&>div]:bg-orange-400 peer-checked:[&>div>div]:bg-white peer-checked:[&>div>div]:translate-x-[1.5rem]">
                <div className="w-12 h-6 p-1 rounded-full bg-orange-100 transition-colors group-hover:shadow-lg group-hover:shadow-orange-100">
                    <div className="w-4 h-4 bg-orange-400 rounded-full transition-all"></div>
                </div>
            </div>

            <div>
                <span>{label}</span>
                <p className="text-gray-600 text-xs font-light">{description}</p>
            </div>
        </label>
    )
})