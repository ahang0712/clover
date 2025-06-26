; ModuleID = 'i2c_pca_isa_1-opt.bc'
source_filename = "/home/vip/hanghe/race-master/llvm-api-demo/c-src/code/i2c_pca_isa/i2c_pca_isa_1.c"
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
@global_clock = common global i32 0, align 4
@cnt5 = common global i32 0, align 4
@cnt6 = common global i32 0, align 4

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
  store i32 1, i32* @global_dev, align 4, !dbg !14, !tbaa !10
  %1 = load i32, i32* @global_dev, align 4, !dbg !15, !tbaa !10
  %2 = icmp ne i32 %1, 1, !dbg !15
  br i1 %2, label %3, label %4, !dbg !15

3:                                                ; preds = %0
  br label %4, !dbg !15

4:                                                ; preds = %3, %0
  %5 = load i32, i32* @irq, align 4, !dbg !15, !tbaa !10
  %6 = icmp sgt i32 %5, -1, !dbg !15
  br i1 %6, label %7, label %12, !dbg !15

7:                                                ; preds = %4
  %8 = load i32, i32* @global_id, align 4, !dbg !15, !tbaa !10
  %9 = icmp ne i32 %8, 1, !dbg !15
  br i1 %9, label %10, label %11, !dbg !15

10:                                               ; preds = %7
  br label %11, !dbg !15

11:                                               ; preds = %10, %7
  br label %12, !dbg !15

12:                                               ; preds = %11, %4
  store i32 -1, i32* @global_id, align 4, !dbg !16, !tbaa !10
  store i32 -1, i32* @global_dev, align 4, !dbg !16, !tbaa !10
  %13 = load i32, i32* @cnt1, align 4, !dbg !17, !tbaa !10
  %14 = add nsw i32 %13, 1, !dbg !17
  store i32 %14, i32* @cnt1, align 4, !dbg !17, !tbaa !10
  ret void, !dbg !18
}

; Function Attrs: nounwind uwtable
define void @req_isr_1() #2 !dbg !19 {
  store i32 2, i32* @irq, align 4, !dbg !20, !tbaa !10
  store i32 2, i32* @global_id, align 4, !dbg !21, !tbaa !10
  store i32 2, i32* @global_dev, align 4, !dbg !21, !tbaa !10
  %1 = load i32, i32* @global_dev, align 4, !dbg !22, !tbaa !10
  %2 = icmp ne i32 %1, 2, !dbg !22
  br i1 %2, label %3, label %4, !dbg !22

3:                                                ; preds = %0
  br label %4, !dbg !22

4:                                                ; preds = %3, %0
  %5 = load i32, i32* @irq, align 4, !dbg !22, !tbaa !10
  %6 = icmp sgt i32 %5, -1, !dbg !22
  br i1 %6, label %7, label %12, !dbg !22

7:                                                ; preds = %4
  %8 = load i32, i32* @global_id, align 4, !dbg !22, !tbaa !10
  %9 = icmp ne i32 %8, 2, !dbg !22
  br i1 %9, label %10, label %11, !dbg !22

10:                                               ; preds = %7
  br label %11, !dbg !22

11:                                               ; preds = %10, %7
  br label %12, !dbg !22

12:                                               ; preds = %11, %4
  store i32 -1, i32* @global_id, align 4, !dbg !23, !tbaa !10
  store i32 -1, i32* @global_dev, align 4, !dbg !23, !tbaa !10
  %13 = load i32, i32* @cnt2, align 4, !dbg !24, !tbaa !10
  %14 = add nsw i32 %13, 1, !dbg !24
  store i32 %14, i32* @cnt2, align 4, !dbg !24, !tbaa !10
  ret void, !dbg !25
}

; Function Attrs: nounwind uwtable
define void @req_isr_2() #2 !dbg !26 {
  store i32 3, i32* @irq, align 4, !dbg !27, !tbaa !10
  store i32 3, i32* @global_id, align 4, !dbg !28, !tbaa !10
  store i32 3, i32* @global_dev, align 4, !dbg !28, !tbaa !10
  %1 = load i32, i32* @global_dev, align 4, !dbg !29, !tbaa !10
  %2 = icmp ne i32 %1, 3, !dbg !29
  br i1 %2, label %3, label %4, !dbg !29

3:                                                ; preds = %0
  br label %4, !dbg !29

4:                                                ; preds = %3, %0
  %5 = load i32, i32* @irq, align 4, !dbg !29, !tbaa !10
  %6 = icmp sgt i32 %5, -1, !dbg !29
  br i1 %6, label %7, label %12, !dbg !29

7:                                                ; preds = %4
  %8 = load i32, i32* @global_id, align 4, !dbg !29, !tbaa !10
  %9 = icmp ne i32 %8, 3, !dbg !29
  br i1 %9, label %10, label %11, !dbg !29

10:                                               ; preds = %7
  br label %11, !dbg !29

11:                                               ; preds = %10, %7
  br label %12, !dbg !29

12:                                               ; preds = %11, %4
  store i32 -1, i32* @global_id, align 4, !dbg !30, !tbaa !10
  store i32 -1, i32* @global_dev, align 4, !dbg !30, !tbaa !10
  %13 = load i32, i32* @cnt3, align 4, !dbg !31, !tbaa !10
  %14 = add nsw i32 %13, 1, !dbg !31
  store i32 %14, i32* @cnt3, align 4, !dbg !31, !tbaa !10
  ret void, !dbg !32
}

; Function Attrs: nounwind uwtable
define void @req_isr_3() #2 !dbg !33 {
  store i32 -1, i32* @irq, align 4, !dbg !34, !tbaa !10
  %1 = load i32, i32* @cnt4, align 4, !dbg !35, !tbaa !10
  %2 = add nsw i32 %1, 1, !dbg !35
  store i32 %2, i32* @cnt4, align 4, !dbg !35, !tbaa !10
  ret void, !dbg !36
}

; Function Attrs: nounwind uwtable
define i32 @svp_simple_007_001_main() #2 !dbg !37 {
  store i32 1, i32* @irq, align 4, !dbg !38, !tbaa !10
  store i32 1, i32* @global_id, align 4, !dbg !40, !tbaa !10
  store i32 1, i32* @global_dev, align 4, !dbg !40, !tbaa !10
  %1 = load i32, i32* @global_dev, align 4, !dbg !41, !tbaa !10
  %2 = icmp ne i32 %1, 1, !dbg !41
  br i1 %2, label %3, label %4, !dbg !41

3:                                                ; preds = %0
  br label %4, !dbg !41

4:                                                ; preds = %3, %0
  %5 = load i32, i32* @irq, align 4, !dbg !41, !tbaa !10
  %6 = icmp sgt i32 %5, -1, !dbg !41
  br i1 %6, label %7, label %req1.exit, !dbg !41

7:                                                ; preds = %4
  %8 = load i32, i32* @global_id, align 4, !dbg !41, !tbaa !10
  %9 = icmp ne i32 %8, 1, !dbg !41
  br i1 %9, label %10, label %11, !dbg !41

10:                                               ; preds = %7
  br label %11, !dbg !41

11:                                               ; preds = %10, %7
  br label %req1.exit, !dbg !41

req1.exit:                                        ; preds = %4, %11
  store i32 -1, i32* @global_id, align 4, !dbg !42, !tbaa !10
  store i32 -1, i32* @global_dev, align 4, !dbg !42, !tbaa !10
  %12 = load i32, i32* @cnt1, align 4, !dbg !43, !tbaa !10
  %13 = add nsw i32 %12, 1, !dbg !43
  store i32 %13, i32* @cnt1, align 4, !dbg !43, !tbaa !10
  ret i32 0, !dbg !44
}

attributes #0 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone willreturn }
attributes #2 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/code/i2c_pca_isa/i2c_pca_isa_1.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/code/i2c_pca_isa")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "req1", scope: !1, file: !1, line: 256, type: !8, scopeLine: 256, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !2)
!9 = !DILocation(line: 258, column: 13, scope: !7)
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !12, i64 0}
!12 = !{!"omnipotent char", !13, i64 0}
!13 = !{!"Simple C/C++ TBAA"}
!14 = !DILocation(line: 259, column: 9, scope: !7)
!15 = !DILocation(line: 260, column: 9, scope: !7)
!16 = !DILocation(line: 261, column: 9, scope: !7)
!17 = !DILocation(line: 262, column: 13, scope: !7)
!18 = !DILocation(line: 264, column: 1, scope: !7)
!19 = distinct !DISubprogram(name: "req_isr_1", scope: !1, file: !1, line: 266, type: !8, scopeLine: 266, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!20 = !DILocation(line: 268, column: 13, scope: !19)
!21 = !DILocation(line: 269, column: 9, scope: !19)
!22 = !DILocation(line: 270, column: 9, scope: !19)
!23 = !DILocation(line: 271, column: 9, scope: !19)
!24 = !DILocation(line: 272, column: 13, scope: !19)
!25 = !DILocation(line: 274, column: 1, scope: !19)
!26 = distinct !DISubprogram(name: "req_isr_2", scope: !1, file: !1, line: 276, type: !8, scopeLine: 276, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!27 = !DILocation(line: 278, column: 13, scope: !26)
!28 = !DILocation(line: 279, column: 9, scope: !26)
!29 = !DILocation(line: 280, column: 9, scope: !26)
!30 = !DILocation(line: 281, column: 9, scope: !26)
!31 = !DILocation(line: 282, column: 13, scope: !26)
!32 = !DILocation(line: 284, column: 1, scope: !26)
!33 = distinct !DISubprogram(name: "req_isr_3", scope: !1, file: !1, line: 286, type: !8, scopeLine: 286, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!34 = !DILocation(line: 288, column: 13, scope: !33)
!35 = !DILocation(line: 289, column: 13, scope: !33)
!36 = !DILocation(line: 291, column: 1, scope: !33)
!37 = distinct !DISubprogram(name: "svp_simple_007_001_main", scope: !1, file: !1, line: 295, type: !8, scopeLine: 296, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!38 = !DILocation(line: 258, column: 13, scope: !7, inlinedAt: !39)
!39 = distinct !DILocation(line: 299, column: 5, scope: !37)
!40 = !DILocation(line: 259, column: 9, scope: !7, inlinedAt: !39)
!41 = !DILocation(line: 260, column: 9, scope: !7, inlinedAt: !39)
!42 = !DILocation(line: 261, column: 9, scope: !7, inlinedAt: !39)
!43 = !DILocation(line: 262, column: 13, scope: !7, inlinedAt: !39)
!44 = !DILocation(line: 313, column: 5, scope: !37)
