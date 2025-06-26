; ModuleID = 'svp_simple_023_001-opt.bc'
source_filename = "./svp_simple_023_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@svp_simple_023_001_global_var = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @svp_simple_023_001_main() #0 !dbg !7 {
  call void (...) @init() #2, !dbg !10
  %1 = load volatile i32, i32* @svp_simple_023_001_global_var, align 4, !dbg !13, !tbaa !14
  %2 = icmp sgt i32 %1, 0, !dbg !18
  br i1 %2, label %3, label %svp_simple_023_001_func_1.exit, !dbg !21

3:                                                ; preds = %0
  %4 = icmp slt i32 %1, 12, !dbg !22
  br i1 %4, label %5, label %svp_simple_023_001_func_1.exit, !dbg !23

5:                                                ; preds = %3
  %6 = load volatile i32, i32* @svp_simple_023_001_global_var, align 4, !dbg !24, !tbaa !14
  %7 = add nsw i32 %6, 1, !dbg !25
  store volatile i32 %7, i32* @svp_simple_023_001_global_var, align 4, !dbg !26, !tbaa !14
  br label %svp_simple_023_001_func_1.exit, !dbg !27

svp_simple_023_001_func_1.exit:                   ; preds = %0, %3, %5
  ret void, !dbg !28
}

; Function Attrs: nounwind uwtable
define void @svp_simple_023_001_func_1(i32 %0) #0 !dbg !19 {
  %2 = icmp sgt i32 %0, 0, !dbg !29
  br i1 %2, label %3, label %8, !dbg !30

3:                                                ; preds = %1
  %4 = icmp slt i32 %0, 12, !dbg !31
  br i1 %4, label %5, label %8, !dbg !32

5:                                                ; preds = %3
  %6 = load volatile i32, i32* @svp_simple_023_001_global_var, align 4, !dbg !33, !tbaa !14
  %7 = add nsw i32 %6, 1, !dbg !34
  store volatile i32 %7, i32* @svp_simple_023_001_global_var, align 4, !dbg !35, !tbaa !14
  br label %8, !dbg !36

8:                                                ; preds = %5, %3, %1
  ret void, !dbg !37
}

; Function Attrs: nounwind uwtable
define void @svp_simple_023_001_init() #0 !dbg !11 {
  call void (...) @init(), !dbg !38
  ret void, !dbg !39
}

declare void @init(...) #1

; Function Attrs: nounwind uwtable
define void @svp_simple_023_001_isr_1() #0 !dbg !40 {
  store volatile i32 0, i32* @svp_simple_023_001_global_var, align 4, !dbg !41, !tbaa !14
  ret void, !dbg !42
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

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
!10 = !DILocation(line: 15, column: 3, scope: !11, inlinedAt: !12)
!11 = distinct !DISubprogram(name: "svp_simple_023_001_init", scope: !8, file: !8, line: 12, type: !9, scopeLine: 12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!12 = distinct !DILocation(line: 9, column: 3, scope: !7)
!13 = !DILocation(line: 10, column: 29, scope: !7)
!14 = !{!15, !15, i64 0}
!15 = !{!"int", !16, i64 0}
!16 = !{!"omnipotent char", !17, i64 0}
!17 = !{!"Simple C/C++ TBAA"}
!18 = !DILocation(line: 19, column: 11, scope: !19, inlinedAt: !20)
!19 = distinct !DISubprogram(name: "svp_simple_023_001_func_1", scope: !8, file: !8, line: 18, type: !9, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!20 = distinct !DILocation(line: 10, column: 3, scope: !7)
!21 = !DILocation(line: 19, column: 15, scope: !19, inlinedAt: !20)
!22 = !DILocation(line: 19, column: 22, scope: !19, inlinedAt: !20)
!23 = !DILocation(line: 19, column: 7, scope: !19, inlinedAt: !20)
!24 = !DILocation(line: 20, column: 37, scope: !19, inlinedAt: !20)
!25 = !DILocation(line: 20, column: 67, scope: !19, inlinedAt: !20)
!26 = !DILocation(line: 20, column: 35, scope: !19, inlinedAt: !20)
!27 = !DILocation(line: 21, column: 3, scope: !19, inlinedAt: !20)
!28 = !DILocation(line: 11, column: 1, scope: !7)
!29 = !DILocation(line: 19, column: 11, scope: !19)
!30 = !DILocation(line: 19, column: 15, scope: !19)
!31 = !DILocation(line: 19, column: 22, scope: !19)
!32 = !DILocation(line: 19, column: 7, scope: !19)
!33 = !DILocation(line: 20, column: 37, scope: !19)
!34 = !DILocation(line: 20, column: 67, scope: !19)
!35 = !DILocation(line: 20, column: 35, scope: !19)
!36 = !DILocation(line: 21, column: 3, scope: !19)
!37 = !DILocation(line: 22, column: 1, scope: !19)
!38 = !DILocation(line: 15, column: 3, scope: !11)
!39 = !DILocation(line: 16, column: 1, scope: !11)
!40 = distinct !DISubprogram(name: "svp_simple_023_001_isr_1", scope: !8, file: !8, line: 23, type: !9, scopeLine: 23, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!41 = !DILocation(line: 24, column: 33, scope: !40)
!42 = !DILocation(line: 25, column: 1, scope: !40)
