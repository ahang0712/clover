; ModuleID = 'i2c_pca_isa_2-opt.bc'
source_filename = "/home/vip/hanghe/race-master/llvm-api-demo/c-src/code/i2c_pca_isa/i2c_pca_isa_2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@stdout = external global %struct._IO_FILE*, align 8
@stdin = external global %struct._IO_FILE*, align 8
@irq = common global i32 0, align 4
@global_id = common global i32 0, align 4
@global_dev = common global i32 0, align 4
@cnt1 = common global i32 0, align 4
@cnt2 = common global i32 0, align 4
@cnt3 = common global i32 0, align 4
@cnt4 = common global i32 0, align 4
@cnt5 = common global i32 0, align 4
@cnt6 = common global i32 0, align 4
@global_clock = common global i32 0, align 4

declare i32 @vfprintf(%struct._IO_FILE*, i8*, %struct.__va_list_tag*) #0

declare i32 @_IO_getc(%struct._IO_FILE*) #0

; Function Attrs: nounwind readnone willreturn
declare i64 @llvm.expect.i64(i64, i64) #1

declare i32 @__uflow(%struct._IO_FILE*) #0

declare i32 @_IO_putc(i32, %struct._IO_FILE*) #0

declare i32 @__overflow(%struct._IO_FILE*, i32) #0

; Function Attrs: nounwind uwtable
define void @req1() #2 !dbg !7 {
  store i32 1, i32* @irq, align 4, !dbg !9, !tbaa !10
  store i32 1, i32* @global_id, align 4, !dbg !14, !tbaa !10
  store i32 1, i32* @global_dev, align 4, !dbg !15, !tbaa !10
  %1 = load i32, i32* @global_dev, align 4, !dbg !16, !tbaa !10
  %2 = icmp ne i32 %1, 1, !dbg !17
  br i1 %2, label %3, label %4, !dbg !16

3:                                                ; preds = %0
  br label %4, !dbg !18

4:                                                ; preds = %3, %0
  %5 = load i32, i32* @irq, align 4, !dbg !19, !tbaa !10
  %6 = icmp sgt i32 %5, -1, !dbg !20
  br i1 %6, label %7, label %12, !dbg !19

7:                                                ; preds = %4
  %8 = load i32, i32* @global_id, align 4, !dbg !21, !tbaa !10
  %9 = icmp ne i32 %8, 1, !dbg !22
  br i1 %9, label %10, label %11, !dbg !21

10:                                               ; preds = %7
  br label %11, !dbg !23

11:                                               ; preds = %10, %7
  br label %12, !dbg !24

12:                                               ; preds = %11, %4
  store i32 -1, i32* @global_id, align 4, !dbg !25, !tbaa !10
  store i32 -1, i32* @global_dev, align 4, !dbg !26, !tbaa !10
  %13 = load i32, i32* @cnt1, align 4, !dbg !27, !tbaa !10
  %14 = add nsw i32 %13, 1, !dbg !27
  store i32 %14, i32* @cnt1, align 4, !dbg !27, !tbaa !10
  ret void, !dbg !28
}

; Function Attrs: nounwind uwtable
define void @req2() #2 !dbg !29 {
  store i32 2, i32* @irq, align 4, !dbg !30, !tbaa !10
  store i32 2, i32* @global_id, align 4, !dbg !31, !tbaa !10
  store i32 2, i32* @global_dev, align 4, !dbg !32, !tbaa !10
  %1 = load i32, i32* @global_dev, align 4, !dbg !33, !tbaa !10
  %2 = icmp ne i32 %1, 2, !dbg !34
  br i1 %2, label %3, label %4, !dbg !33

3:                                                ; preds = %0
  br label %4, !dbg !35

4:                                                ; preds = %3, %0
  %5 = load i32, i32* @irq, align 4, !dbg !36, !tbaa !10
  %6 = icmp sgt i32 %5, -1, !dbg !37
  br i1 %6, label %7, label %12, !dbg !36

7:                                                ; preds = %4
  %8 = load i32, i32* @global_id, align 4, !dbg !38, !tbaa !10
  %9 = icmp ne i32 %8, 2, !dbg !39
  br i1 %9, label %10, label %11, !dbg !38

10:                                               ; preds = %7
  br label %11, !dbg !40

11:                                               ; preds = %10, %7
  br label %12, !dbg !41

12:                                               ; preds = %11, %4
  %13 = load i32, i32* @cnt2, align 4, !dbg !42, !tbaa !10
  %14 = add nsw i32 %13, 1, !dbg !42
  store i32 %14, i32* @cnt2, align 4, !dbg !42, !tbaa !10
  ret void, !dbg !43
}

; Function Attrs: nounwind uwtable
define void @req_isr_1() #2 !dbg !44 {
  store i32 3, i32* @irq, align 4, !dbg !45, !tbaa !10
  store i32 3, i32* @global_id, align 4, !dbg !46, !tbaa !10
  store i32 3, i32* @global_dev, align 4, !dbg !47, !tbaa !10
  %1 = load i32, i32* @global_dev, align 4, !dbg !48, !tbaa !10
  %2 = icmp ne i32 %1, 3, !dbg !49
  br i1 %2, label %3, label %4, !dbg !48

3:                                                ; preds = %0
  br label %4, !dbg !50

4:                                                ; preds = %3, %0
  %5 = load i32, i32* @irq, align 4, !dbg !51, !tbaa !10
  %6 = icmp sgt i32 %5, -1, !dbg !52
  br i1 %6, label %7, label %12, !dbg !51

7:                                                ; preds = %4
  %8 = load i32, i32* @global_id, align 4, !dbg !53, !tbaa !10
  %9 = icmp ne i32 %8, 3, !dbg !54
  br i1 %9, label %10, label %11, !dbg !53

10:                                               ; preds = %7
  br label %11, !dbg !55

11:                                               ; preds = %10, %7
  br label %12, !dbg !56

12:                                               ; preds = %11, %4
  %13 = load i32, i32* @cnt3, align 4, !dbg !57, !tbaa !10
  %14 = add nsw i32 %13, 1, !dbg !57
  store i32 %14, i32* @cnt3, align 4, !dbg !57, !tbaa !10
  ret void, !dbg !58
}

; Function Attrs: nounwind uwtable
define void @req_isr_2() #2 !dbg !59 {
  store i32 0, i32* @irq, align 4, !dbg !60, !tbaa !10
  store i32 4, i32* @global_id, align 4, !dbg !61, !tbaa !10
  store i32 4, i32* @global_dev, align 4, !dbg !62, !tbaa !10
  %1 = load i32, i32* @global_dev, align 4, !dbg !63, !tbaa !10
  %2 = icmp ne i32 %1, 4, !dbg !64
  br i1 %2, label %3, label %4, !dbg !63

3:                                                ; preds = %0
  br label %4, !dbg !65

4:                                                ; preds = %3, %0
  %5 = load i32, i32* @irq, align 4, !dbg !66, !tbaa !10
  %6 = icmp sgt i32 %5, -1, !dbg !67
  br i1 %6, label %7, label %12, !dbg !66

7:                                                ; preds = %4
  %8 = load i32, i32* @global_id, align 4, !dbg !68, !tbaa !10
  %9 = icmp ne i32 %8, 4, !dbg !69
  br i1 %9, label %10, label %11, !dbg !68

10:                                               ; preds = %7
  br label %11, !dbg !70

11:                                               ; preds = %10, %7
  br label %12, !dbg !71

12:                                               ; preds = %11, %4
  %13 = load i32, i32* @cnt4, align 4, !dbg !72, !tbaa !10
  %14 = add nsw i32 %13, 1, !dbg !72
  store i32 %14, i32* @cnt4, align 4, !dbg !72, !tbaa !10
  ret void, !dbg !73
}

; Function Attrs: nounwind uwtable
define void @req_isr_3() #2 !dbg !74 {
  store i32 0, i32* @irq, align 4, !dbg !75, !tbaa !10
  store i32 5, i32* @global_id, align 4, !dbg !76, !tbaa !10
  store i32 5, i32* @global_dev, align 4, !dbg !76, !tbaa !10
  store i32 5, i32* @global_id, align 4, !dbg !77, !tbaa !10
  store i32 5, i32* @global_dev, align 4, !dbg !78, !tbaa !10
  %1 = load i32, i32* @cnt5, align 4, !dbg !79, !tbaa !10
  %2 = add nsw i32 %1, 1, !dbg !79
  store i32 %2, i32* @cnt5, align 4, !dbg !79, !tbaa !10
  ret void, !dbg !80
}

; Function Attrs: nounwind uwtable
define void @req6() #2 !dbg !81 {
  store i32 -1, i32* @irq, align 4, !dbg !82, !tbaa !10
  %1 = load i32, i32* @cnt6, align 4, !dbg !83, !tbaa !10
  %2 = add nsw i32 %1, 1, !dbg !83
  store i32 %2, i32* @cnt6, align 4, !dbg !83, !tbaa !10
  ret void, !dbg !84
}

; Function Attrs: nounwind uwtable
define i32 @svp_simple_008_001_main() #2 !dbg !85 {
  store i32 1, i32* @irq, align 4, !dbg !86, !tbaa !10
  store i32 1, i32* @global_id, align 4, !dbg !88, !tbaa !10
  store i32 1, i32* @global_dev, align 4, !dbg !89, !tbaa !10
  %1 = load i32, i32* @global_dev, align 4, !dbg !90, !tbaa !10
  %2 = icmp ne i32 %1, 1, !dbg !91
  br i1 %2, label %3, label %4, !dbg !90

3:                                                ; preds = %0
  br label %4, !dbg !92

4:                                                ; preds = %3, %0
  %5 = load i32, i32* @irq, align 4, !dbg !93, !tbaa !10
  %6 = icmp sgt i32 %5, -1, !dbg !94
  br i1 %6, label %7, label %req1.exit, !dbg !93

7:                                                ; preds = %4
  %8 = load i32, i32* @global_id, align 4, !dbg !95, !tbaa !10
  %9 = icmp ne i32 %8, 1, !dbg !96
  br i1 %9, label %10, label %11, !dbg !95

10:                                               ; preds = %7
  br label %11, !dbg !97

11:                                               ; preds = %10, %7
  br label %req1.exit, !dbg !98

req1.exit:                                        ; preds = %4, %11
  store i32 -1, i32* @global_id, align 4, !dbg !99, !tbaa !10
  store i32 -1, i32* @global_dev, align 4, !dbg !100, !tbaa !10
  %12 = load i32, i32* @cnt1, align 4, !dbg !101, !tbaa !10
  %13 = add nsw i32 %12, 1, !dbg !101
  store i32 %13, i32* @cnt1, align 4, !dbg !101, !tbaa !10
  store i32 -1, i32* @irq, align 4, !dbg !102, !tbaa !10
  %14 = load i32, i32* @cnt6, align 4, !dbg !104, !tbaa !10
  %15 = add nsw i32 %14, 1, !dbg !104
  store i32 %15, i32* @cnt6, align 4, !dbg !104, !tbaa !10
  ret i32 0, !dbg !105
}

attributes #0 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone willreturn }
attributes #2 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/code/i2c_pca_isa/i2c_pca_isa_2.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/code/i2c_pca_isa")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "req1", scope: !1, file: !1, line: 277, type: !8, scopeLine: 277, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !2)
!9 = !DILocation(line: 281, column: 9, scope: !7)
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !12, i64 0}
!12 = !{!"omnipotent char", !13, i64 0}
!13 = !{!"Simple C/C++ TBAA"}
!14 = !DILocation(line: 283, column: 15, scope: !7)
!15 = !DILocation(line: 284, column: 16, scope: !7)
!16 = !DILocation(line: 286, column: 9, scope: !7)
!17 = !DILocation(line: 286, column: 20, scope: !7)
!18 = !DILocation(line: 287, column: 5, scope: !7)
!19 = !DILocation(line: 288, column: 9, scope: !7)
!20 = !DILocation(line: 288, column: 13, scope: !7)
!21 = !DILocation(line: 289, column: 13, scope: !7)
!22 = !DILocation(line: 289, column: 23, scope: !7)
!23 = !DILocation(line: 290, column: 9, scope: !7)
!24 = !DILocation(line: 291, column: 5, scope: !7)
!25 = !DILocation(line: 293, column: 15, scope: !7)
!26 = !DILocation(line: 294, column: 16, scope: !7)
!27 = !DILocation(line: 295, column: 9, scope: !7)
!28 = !DILocation(line: 297, column: 1, scope: !7)
!29 = distinct !DISubprogram(name: "req2", scope: !1, file: !1, line: 299, type: !8, scopeLine: 299, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!30 = !DILocation(line: 303, column: 9, scope: !29)
!31 = !DILocation(line: 305, column: 15, scope: !29)
!32 = !DILocation(line: 306, column: 16, scope: !29)
!33 = !DILocation(line: 308, column: 9, scope: !29)
!34 = !DILocation(line: 308, column: 20, scope: !29)
!35 = !DILocation(line: 309, column: 5, scope: !29)
!36 = !DILocation(line: 310, column: 9, scope: !29)
!37 = !DILocation(line: 310, column: 13, scope: !29)
!38 = !DILocation(line: 311, column: 13, scope: !29)
!39 = !DILocation(line: 311, column: 23, scope: !29)
!40 = !DILocation(line: 312, column: 9, scope: !29)
!41 = !DILocation(line: 313, column: 5, scope: !29)
!42 = !DILocation(line: 317, column: 9, scope: !29)
!43 = !DILocation(line: 319, column: 1, scope: !29)
!44 = distinct !DISubprogram(name: "req_isr_1", scope: !1, file: !1, line: 321, type: !8, scopeLine: 321, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!45 = !DILocation(line: 325, column: 9, scope: !44)
!46 = !DILocation(line: 327, column: 15, scope: !44)
!47 = !DILocation(line: 328, column: 16, scope: !44)
!48 = !DILocation(line: 330, column: 9, scope: !44)
!49 = !DILocation(line: 330, column: 20, scope: !44)
!50 = !DILocation(line: 331, column: 5, scope: !44)
!51 = !DILocation(line: 332, column: 9, scope: !44)
!52 = !DILocation(line: 332, column: 13, scope: !44)
!53 = !DILocation(line: 333, column: 13, scope: !44)
!54 = !DILocation(line: 333, column: 23, scope: !44)
!55 = !DILocation(line: 334, column: 9, scope: !44)
!56 = !DILocation(line: 335, column: 5, scope: !44)
!57 = !DILocation(line: 337, column: 9, scope: !44)
!58 = !DILocation(line: 339, column: 1, scope: !44)
!59 = distinct !DISubprogram(name: "req_isr_2", scope: !1, file: !1, line: 341, type: !8, scopeLine: 341, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!60 = !DILocation(line: 345, column: 9, scope: !59)
!61 = !DILocation(line: 347, column: 15, scope: !59)
!62 = !DILocation(line: 348, column: 16, scope: !59)
!63 = !DILocation(line: 350, column: 9, scope: !59)
!64 = !DILocation(line: 350, column: 20, scope: !59)
!65 = !DILocation(line: 351, column: 5, scope: !59)
!66 = !DILocation(line: 352, column: 9, scope: !59)
!67 = !DILocation(line: 352, column: 13, scope: !59)
!68 = !DILocation(line: 353, column: 13, scope: !59)
!69 = !DILocation(line: 353, column: 23, scope: !59)
!70 = !DILocation(line: 354, column: 9, scope: !59)
!71 = !DILocation(line: 355, column: 5, scope: !59)
!72 = !DILocation(line: 357, column: 9, scope: !59)
!73 = !DILocation(line: 359, column: 1, scope: !59)
!74 = distinct !DISubprogram(name: "req_isr_3", scope: !1, file: !1, line: 361, type: !8, scopeLine: 361, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!75 = !DILocation(line: 363, column: 9, scope: !74)
!76 = !DILocation(line: 364, column: 5, scope: !74)
!77 = !DILocation(line: 365, column: 15, scope: !74)
!78 = !DILocation(line: 366, column: 16, scope: !74)
!79 = !DILocation(line: 369, column: 9, scope: !74)
!80 = !DILocation(line: 371, column: 1, scope: !74)
!81 = distinct !DISubprogram(name: "req6", scope: !1, file: !1, line: 373, type: !8, scopeLine: 373, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!82 = !DILocation(line: 375, column: 9, scope: !81)
!83 = !DILocation(line: 376, column: 9, scope: !81)
!84 = !DILocation(line: 378, column: 1, scope: !81)
!85 = distinct !DISubprogram(name: "svp_simple_008_001_main", scope: !1, file: !1, line: 380, type: !8, scopeLine: 380, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!86 = !DILocation(line: 281, column: 9, scope: !7, inlinedAt: !87)
!87 = distinct !DILocation(line: 382, column: 5, scope: !85)
!88 = !DILocation(line: 283, column: 15, scope: !7, inlinedAt: !87)
!89 = !DILocation(line: 284, column: 16, scope: !7, inlinedAt: !87)
!90 = !DILocation(line: 286, column: 9, scope: !7, inlinedAt: !87)
!91 = !DILocation(line: 286, column: 20, scope: !7, inlinedAt: !87)
!92 = !DILocation(line: 287, column: 5, scope: !7, inlinedAt: !87)
!93 = !DILocation(line: 288, column: 9, scope: !7, inlinedAt: !87)
!94 = !DILocation(line: 288, column: 13, scope: !7, inlinedAt: !87)
!95 = !DILocation(line: 289, column: 13, scope: !7, inlinedAt: !87)
!96 = !DILocation(line: 289, column: 23, scope: !7, inlinedAt: !87)
!97 = !DILocation(line: 290, column: 9, scope: !7, inlinedAt: !87)
!98 = !DILocation(line: 291, column: 5, scope: !7, inlinedAt: !87)
!99 = !DILocation(line: 293, column: 15, scope: !7, inlinedAt: !87)
!100 = !DILocation(line: 294, column: 16, scope: !7, inlinedAt: !87)
!101 = !DILocation(line: 295, column: 9, scope: !7, inlinedAt: !87)
!102 = !DILocation(line: 375, column: 9, scope: !81, inlinedAt: !103)
!103 = distinct !DILocation(line: 384, column: 5, scope: !85)
!104 = !DILocation(line: 376, column: 9, scope: !81, inlinedAt: !103)
!105 = !DILocation(line: 394, column: 5, scope: !85)
