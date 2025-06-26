; ModuleID = 'svp_simple_023_001.bc'
source_filename = "./svp_simple_023_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@svp_simple_023_001_global_var = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @svp_simple_023_001_main() #0 !dbg !7 {
  call void @svp_simple_023_001_init(), !dbg !10
  %1 = load volatile i32, i32* @svp_simple_023_001_global_var, align 4, !dbg !11, !tbaa !12
  call void @svp_simple_023_001_func_1(i32 %1), !dbg !16
  ret void, !dbg !17
}

; Function Attrs: nounwind uwtable
define void @svp_simple_023_001_func_1(i32 %0) #0 !dbg !18 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4, !tbaa !12
  %3 = load i32, i32* %2, align 4, !dbg !19, !tbaa !12
  %4 = icmp sgt i32 %3, 0, !dbg !20
  br i1 %4, label %5, label %11, !dbg !21

5:                                                ; preds = %1
  %6 = load i32, i32* %2, align 4, !dbg !22, !tbaa !12
  %7 = icmp slt i32 %6, 12, !dbg !23
  br i1 %7, label %8, label %11, !dbg !19

8:                                                ; preds = %5
  %9 = load volatile i32, i32* @svp_simple_023_001_global_var, align 4, !dbg !24, !tbaa !12
  %10 = add nsw i32 %9, 1, !dbg !25
  store volatile i32 %10, i32* @svp_simple_023_001_global_var, align 4, !dbg !26, !tbaa !12
  br label %11, !dbg !27

11:                                               ; preds = %8, %5, %1
  ret void, !dbg !28
}

; Function Attrs: nounwind uwtable
define void @svp_simple_023_001_init() #0 !dbg !29 {
  call void (...) @init(), !dbg !30
  ret void, !dbg !31
}

declare void @init(...) #1

; Function Attrs: nounwind uwtable
define void @svp_simple_023_001_isr_1() #0 !dbg !32 {
  store volatile i32 0, i32* @svp_simple_023_001_global_var, align 4, !dbg !33, !tbaa !12
  ret void, !dbg !34
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_023_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_023")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_023_001_main", scope: !8, file: !8, line: 8, type: !9, scopeLine: 8, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_023_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_023")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 9, column: 3, scope: !7)
!11 = !DILocation(line: 10, column: 29, scope: !7)
!12 = !{!13, !13, i64 0}
!13 = !{!"int", !14, i64 0}
!14 = !{!"omnipotent char", !15, i64 0}
!15 = !{!"Simple C/C++ TBAA"}
!16 = !DILocation(line: 10, column: 3, scope: !7)
!17 = !DILocation(line: 11, column: 1, scope: !7)
!18 = distinct !DISubprogram(name: "svp_simple_023_001_func_1", scope: !8, file: !8, line: 18, type: !9, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!19 = !DILocation(line: 19, column: 7, scope: !18)
!20 = !DILocation(line: 19, column: 11, scope: !18)
!21 = !DILocation(line: 19, column: 15, scope: !18)
!22 = !DILocation(line: 19, column: 18, scope: !18)
!23 = !DILocation(line: 19, column: 22, scope: !18)
!24 = !DILocation(line: 20, column: 37, scope: !18)
!25 = !DILocation(line: 20, column: 67, scope: !18)
!26 = !DILocation(line: 20, column: 35, scope: !18)
!27 = !DILocation(line: 21, column: 3, scope: !18)
!28 = !DILocation(line: 22, column: 1, scope: !18)
!29 = distinct !DISubprogram(name: "svp_simple_023_001_init", scope: !8, file: !8, line: 12, type: !9, scopeLine: 12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!30 = !DILocation(line: 15, column: 3, scope: !29)
!31 = !DILocation(line: 16, column: 1, scope: !29)
!32 = distinct !DISubprogram(name: "svp_simple_023_001_isr_1", scope: !8, file: !8, line: 23, type: !9, scopeLine: 23, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!33 = !DILocation(line: 24, column: 33, scope: !32)
!34 = !DILocation(line: 25, column: 1, scope: !32)
